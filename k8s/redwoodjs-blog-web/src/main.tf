module "helm" {
  source    = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=40bbc7b"
  name      = var.md_metadata.name_prefix
  namespace = var.namespace

  chart           = "redwoodjs"
  helm_repository = "https://massdriver-cloud.github.io/helm-charts/"
  helm_version    = "0.1"

  kubernetes_cluster = var.kubernetes_cluster

  helm_additional_values = {
    # # The default command, args, and migration settings are below. Any
    # # values in values.yaml can be overwritten by adding a parameter to your massdriver.yaml
    # # or by hard coding the value here
    #     command = ["yarn"]
    #     args    = ["foo"]    
    args = [
      "node_modules/.bin/rw-server", "web", "--apiHost", "https://${var.blog_api.data.api.hostname}"
    ]

    migration = {
      enabled = false
    }
  }
}
