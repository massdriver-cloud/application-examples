locals {
  helm_additional_values = merge(module.k8s_application.helm_additional_values, {
    serviceAccount = {
      annotations = {
        "iam.gke.io/gcp-service-account" = google_service_account.application.email
      }
    }
  })
}
