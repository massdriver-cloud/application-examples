module "application_app_service" {
  # source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-azure-app-service?ref=9aab9df"
  source      = "../../../../../terraform-modules/massdriver-application-azure-app-service"
  md_metadata = var.md_metadata
  application = var.application
  image = merge(var.image, {
    repository = "massdrivercentralus.azurecr.io/storage/hello-world"
  })
  dns = var.endpoint
  network = {
    auto = true
  }
  monitoring = {
    mode = "AUTOMATED"
  }
  virtual_network_id = var.azure_virtual_network.data.infrastructure.id
  location           = var.azure_virtual_network.specs.azure.region
  contact_email      = var.md_metadata.target.contact_email
}
