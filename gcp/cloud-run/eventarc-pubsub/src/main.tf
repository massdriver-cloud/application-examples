locals {
  repository = "us-west2-docker.pkg.dev/mdc-trellis-staging-trellis/trellis"
  image = "eventarc"
}

module "application_cloud_run" {
  source          = "github.com/massdriver-cloud/terraform-modules//massdriver-application-gcp-cloud-run?ref=3ee9d5f"
  md_metadata     = var.md_metadata
  location        = local.gcp_region
  container_image = "${local.repository}/${local.image}:${var.container.tag}"
  container_port  = 8080
  endpoint        = var.endpoint
  max_instances   = var.scaling.max_instances
  vpc_connector   = var.gcp_subnetwork.data.infrastructure.vpc_access_connector
}

resource "google_eventarc_trigger" "main" {
    name = var.md_metadata.name_prefix
    location = local.gcp_region
    matching_criteria {
        attribute = "type"
        value = "google.cloud.pubsub.topic.v1.messagePublished"
    }
    destination {
        cloud_run_service {
            service = var.md_metadata.name_prefix
            region = local.gcp_region
        }
    }
    labels = var.md_metadata.default_tags

    depends_on = [
        module.application_cloud_run,
        google_project_service.main
    ]
}

resource "google_project_service" "main" {
  service  = "eventarc.googleapis.com"

  disable_dependent_services = false
  disable_on_destroy         = false
}
