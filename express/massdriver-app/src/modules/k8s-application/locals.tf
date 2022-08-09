locals {
  # directory structure in provisoner env
  # bundle/
  #   app.yaml
  #   chart/
  #   k8s-application/
  #     shared terraform
  #   src/
  #     path.root is from this context
  #     connections.auto.tfvars.json
  #     params.auto.tfvars.json
  #     main.tf
  app_specification = yamldecode(file("${path.root}/../massdriver.yaml"))
  connections       = jsondecode(file("${path.root}/dev.connections.tfvars.json"))
  params            = jsondecode(file("${path.root}/dev.params.tfvars.json"))
  # this is because the CLI creates a chart directory and copies from where the app.yaml specified
  # to this expected directory name
  # https://github.com/massdriver-cloud/massdriver-cli/blob/1564f1bb81aadcc5221095bf9bde062e375291a0/pkg/application/package.go#L63
  helm_chart = "${path.root}/../chart"

  helm_additional_values = {
    envs = concat(
      local.params.envs,
      local.result_envs
    )
    ingress = {
      className = "nginx" // eventually this should come from the kubernetes artifact
      annotations = {
        "cert-manager.io/cluster-issuer" : "letsencrypt-prod"     // eventually this should come from kubernetes artifact
        "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true" // hardcoding this for now, dependent on nginx
      }
    }
  }
}
