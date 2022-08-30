module "cloud_run_application" {
  source          = "github.com/massdriver-cloud/terraform-modules//massdriver-application-gcp-cloud-run"
  location        = var.location
  container_image = "${var.container.repository}/${var.container.image}:${var.container.tag}"
  endpoint        = var.endpoint
}

