locals {
  endpoint_url = var.ingress.enabled ? "https://${var.ingress.host}${var.ingress.path}" : "https://"

  artifact = {
    data = {
      api = {
        hostname = local.endpoint_url
        port     = 443
      }
    }
    specs = {
      azure = {
        region = data.azurerm_resource_group.main.location
      }
      api = {
        version = local.endpoint_url
      }
    }
  }
}

resource "massdriver_artifact" "endpoint" {
  field                = "endpoint"
  provider_resource_id = module.application.application.id
  name                 = "Application Endpoint: ${var.md_metadata.name_prefix}"
  artifact             = jsonencode(local.artifact)
}
