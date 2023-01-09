module "helm" {
  source = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm"
  # source = "../../../../terraform-modules/massdriver-application-helm"
  name               = var.md_metadata.name_prefix
  namespace          = var.namespace
  chart              = "${path.module}/chart"
  kubernetes_cluster = var.kubernetes_cluster
  additional_envs = [
    {
      "name"  = "AZURE_TENANT_ID"
      "value" = var.azure_authentication.data.tenant_id
    }
  ]
}

# resource "azurerm_role_assignment" "example" {
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Reader"
#   principal_id         = data.azurerm_client_config.example.object_id
# }

# resource "azurerm_role_definition" "example" {
#   role_definition_id = "00000000-0000-0000-0000-000000000000"
#   name               = "my-custom-role-definition"
#   scope              = data.azurerm_subscription.primary.id

#   permissions {
#     actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
#     not_actions = []
#   }

#   assignable_scopes = [
#     data.azurerm_subscription.primary.id,
#   ]
# }

# resource "azurerm_role_assignment" "example" {
#   name               = "00000000-0000-0000-0000-000000000000"
#   scope              = data.azurerm_subscription.primary.id
#   role_definition_id = azurerm_role_definition.example.role_definition_resource_id
#   principal_id       = data.azurerm_client_config.example.object_id
# }
