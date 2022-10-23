
module "helm" {
  source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=9839474"
  name               = var.md_metadata.name_prefix
  namespace          = var.namespace
  chart              = "${path.module}/chart"
  kubernetes_cluster = var.kubernetes_cluster
  additional_envs    = var.additionalEnvs
  helm_additional_values = {
    elasticsearch = var.elasticsearch
  }
}