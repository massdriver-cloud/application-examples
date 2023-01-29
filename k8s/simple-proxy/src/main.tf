locals {
  resource_group_name = regex(".*/resource[g|G]roups/(.*)/providers", var.kubernetes_cluster.data.infrastructure.ari)[0]
}

data "azurerm_resource_group" "main" {
  name = local.resource_group_name
}

module "application" {
  source              = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=4db0fa5"
  name                = var.md_metadata.name_prefix
  namespace           = "default"
  chart               = "${path.module}/chart"
  kubernetes_cluster  = var.kubernetes_cluster
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
}
