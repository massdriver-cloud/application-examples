module "application" {
  source      = "github.com/massdriver-cloud/terraform-modules//massdriver-application-azure-function-app?ref=be08a79"
  name        = var.md_metadata.name_prefix
  tags        = var.md_metadata.default_tags
  application = var.application
  docker = merge(var.docker, {
    registry = "massdrivercentralus.azurecr.io"
    image    = "cognitive/claudine"
  })
  network = {
    auto = true
  }
  health_check = {
    path = "/health"
    port = 80
  }
  monitoring = {
    mode = "AUTOMATED"
  }
  dns                = var.dns
  virtual_network_id = var.azure_virtual_network.data.infrastructure.id
  location           = var.azure_virtual_network.specs.azure.region
  contact_email      = var.md_metadata.target.contact_email
  md_metadata        = var.md_metadata
}
