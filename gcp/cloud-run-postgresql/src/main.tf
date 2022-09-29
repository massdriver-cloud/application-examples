locals {
  endpoint_enabled = var.endpoint.enabled
  zone             = local.endpoint_enabled ? var.endpoint.zone.name : null
  subdomain        = local.endpoint_enabled ? var.endpoint.subdomain : null
}

module "cloud_run_application" {
  source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-gcp-cloud-run"
  location           = var.location
  container_image    = "${var.container.repository}/${var.container.image}:${var.container.tag}"
  zone               = local.zone
  subdomain          = local.subdomain
  network            = var.gcp_global_network.data.grn
  vpc_connector_cidr = var.private_service_cidr
}
