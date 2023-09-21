module "helm" {
  source    = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=40bbc7b"
  name      = var.md_metadata.name_prefix
  namespace = var.namespace

  chart           = "redwoodjs"
  helm_repository = "https://massdriver-cloud.github.io/helm-charts/"
  helm_version    = "0.1.0"

  kubernetes_cluster = var.kubernetes_cluster

  helm_additional_values = {
    "massdriver-alarm-channel" = {
      "md_metadata" = var.md_metadata
    }

    args = [
      "node_modules/.bin/rw-server", "web", "--apiHost", "https://${var.blog_api.data.api.hostname}"
    ]
  }
}
