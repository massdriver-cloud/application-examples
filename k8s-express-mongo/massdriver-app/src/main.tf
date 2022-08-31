module "helm_application" {
  # source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=2acadcc"
  source             = "../../../../terraform-modules/massdriver-application-helm"
  name               = var.md_metadata.name_prefix
  namespace          = "default"
  chart              = "${path.module}/chart"
  kubernetes_cluster = var.kubernetes_cluster
}

