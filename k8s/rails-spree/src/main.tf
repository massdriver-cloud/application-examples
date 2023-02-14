module "helm" {
  source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=f69600a394aa00bce1a1b2de50b5d959d758a0b9"
  name               = var.md_metadata.name_prefix
  namespace          = var.namespace
  chart              = "ruby-on-rails"
  helm_repository    = "https://massdriver-cloud.github.io/helm-charts/"
  helm_version       = "0.2.1"
  kubernetes_cluster = var.kubernetes_cluster
  additional_envs    = []
}
