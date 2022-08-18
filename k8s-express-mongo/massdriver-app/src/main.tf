module "k8s_application" {
  source = "./modules/k8s-application"
}

resource "helm_release" "application" {
  name             = module.k8s_application.params.md_metadata.name_prefix
  chart            = "${path.module}/../chart"
  namespace        = module.k8s_application.params.namespace
  create_namespace = true
  force_update     = true

  values = [
    fileexists("${path.module}/../chart/values.yaml") ? file("${path.module}/../chart/values.yaml") : "",
    yamlencode(module.k8s_application.params),
    yamlencode(local.helm_additional_values)
  ]
}
