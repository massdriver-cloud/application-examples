module "helm" {
  source             = "github.com/massdriver-cloud/terraform-modules//massdriver-application-helm?ref=8892201"
  name               = var.md_metadata.name_prefix
  namespace          = "default"
  chart              = "${path.module}/chart"
  kubernetes_cluster = var.kubernetes_cluster
}
