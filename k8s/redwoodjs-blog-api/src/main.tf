module "helm" {
  source    = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=23a47fa"
  name      = var.md_metadata.name_prefix
  namespace = var.namespace

  chart           = "redwoodjs"
  helm_repository = "https://massdriver-cloud.github.io/helm-charts/"
  helm_version    = "0.1.0"

  kubernetes_cluster = var.kubernetes_cluster

  helm_additional_values = {
    # # The default command, args, and migration settings are below. Any
    # # values in values.yaml can be overwritten by adding a parameter to your massdriver.yaml
    # # or by hard coding the value here
    #     command = ["yarn"]
    #     args    = ["foo"]
    "massdriver-alarm-channel" = {
      "md_metadata" = var.md_metadata
    }

    "migration" = {
      "enabled" = true
      "image" = {
        "repository" = "massdrivercloud/rw-console"
        "tag"        = "latest"
      }
      "command" = ["bash", "-c"]
      "args" = [
        "yarn rw prisma migrate deploy"
        # yarn rw prisma generate;
        # yarn rw exec seed;
      ]
    }
  }
}
