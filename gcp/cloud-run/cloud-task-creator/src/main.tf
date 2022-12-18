module "application_cloud_run" {
  source          = "github.com/massdriver-cloud/terraform-modules//massdriver-application-gcp-cloud-run?ref=3ee9d5f"
  md_metadata     = var.md_metadata
  location        = local.gcp_region
  container_image    = "us-central1-docker.pkg.dev/md-demos/cloud-tasks/creator:${var.container.tag}"
  container_port  = 4000
  endpoint        = var.endpoint
  max_instances   = var.max_instances
  vpc_connector   = var.gcp_subnetwork.data.infrastructure.vpc_access_connector
}