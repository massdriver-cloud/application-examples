module "application_app_service" {
  source      = "github.com/massdriver-cloud/terraform-modules//massdriver-application-azure-function-app?ref=718f586"
  md_metadata = var.md_metadata
  application = var.application
  docker = merge(var.docker, {
    registry = "massdrivercentralus.azurecr.io"
    image    = "storage/hello-world"
  })
  network = {
    auto = true
  }
  monitoring = {
    mode = "AUTOMATED"
  }
  dns                = var.dns
  virtual_network_id = var.azure_virtual_network.data.infrastructure.id
  location           = var.azure_virtual_network.specs.azure.region
  contact_email      = var.md_metadata.target.contact_email
}
