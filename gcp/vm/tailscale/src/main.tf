module "application" {
  source   = "github.com/massdriver-cloud/terraform-modules//massdriver-application-gcp-vm?ref=5f3a359"
  location = var.subnetwork.specs.gcp.region
  # container_image = "tailscale/tailscale:${var.container.tag}"
  container_image = "us-central1-docker.pkg.dev/md-demos/apps/tailscale:${var.container.tag}"
  endpoint        = var.endpoint
  max_instances   = var.max_instances
  machine_type    = var.machine_type
  port            = 80
  subnetwork      = var.subnetwork
  health_check = {
    port = 80
    path = "/"
  }
}
