# The _Google_ Service Account for the application
# This will be granted the roles needed, as described by the dependencies
# The k8s service account will be annotated with this identity, and that's
# the glue that enables us to _not_ put a static credential on the cluster
resource "google_service_account" "application" {
  account_id = module.k8s_application.params.md_metadata.name_prefix
}

resource "google_project_iam_binding" "application" {
  project = local.gcp_project_id
  role    = "roles/iam.serviceAccountUser"
  members = [
    "serviceAccount:${google_service_account.application.email}",
  ]
}

# This K8S SA creationg _and_ annotation
# is done in the application helm chart
# resource "kubernetes_service_account" "main" {
#   metadata {
#     name      = local.k8s_given_name
#     namespace = module.k8s_application.params.namespace
#     annotations = {
#       "iam.gke.io/gcp-service-account" = google_service_account.application.email
#     }
#   }
# }

# Grant the K8S SA workloadIdentityUser, so we can don't have to put a GCP SA
# secret on the cluster.
resource "google_service_account_iam_member" "main" {
  service_account_id = google_service_account.application.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${local.gcp_project_id}.svc.id.goog[${module.k8s_application.params.namespace}/${module.k8s_application.params.md_metadata.name_prefix}]"
}

# for _every_ dependency (1-to-many)
#   for _every_ policy (1-to-many)
# grant the GCP service account that role and optionally condition
resource "google_project_iam_member" "workload_identity_sa_bindings" {
  for_each = module.k8s_application.merged_policies
  project  = local.gcp_project_id
  role     = each.value.role
  member   = "serviceAccount:${google_service_account.application.email}"
  # TODO: if an app needs read to _multiple_ of the same service (ex: buckets),
  # I believe this will fail. I don't think you can assign the same _role_
  # multiple times w/ different conditions, we'd have to dynamically _or_ the conditions per role...
  dynamic "condition" {
    for_each = lookup(each.value, "condition", null) != null ? [each.value.condition] : []
    content {
      title      = "condition for ${each.key}"
      expression = condition.value
    }
  }
}
