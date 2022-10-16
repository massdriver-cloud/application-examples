module "application_app_service" {
  # source        = "github.com/massdriver-cloud/terraform-modules//massdriver-application-azure-app-service?ref=9cd01fe"
  source             = "../../../../../terraform-modules/massdriver-application-azure-app-service"
  name               = var.md_metadata.name_prefix
  application        = var.application
  image              = var.image
  dns                = var.dns
  contact_email      = var.md_metadata.target.contact_email
  tags               = var.md_metadata.default_tags
  virtual_network_id = var.virtual_network.data.infrastructure.id
  subnet_cidr        = var.application.subnet_cidr
}
