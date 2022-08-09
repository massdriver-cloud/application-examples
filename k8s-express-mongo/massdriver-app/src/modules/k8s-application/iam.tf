locals {
  dependency_to_policy_map = flatten([for dep_key, dep_value in local.app_specification.dependencies :
    {
      "dependency" = dep_key,
      "policies"   = lookup(dep_value, "policies", [])
    }
    if lookup(dep_value, "policies", "") != ""]
  )
  # for _every_ dependency (1-to-many)
  #   for _every_ policy (1-to-many)
  # creates an array of objects with the following structure:
  # {
  #   "<dependency-name>-policy": {
  #     AWS
  #       "policy_arn": <policy-arn>
  #     Azure
  #       "role": "Role name",
  #       "scope": "resource.name.startsWith...."
  #     GCP
  #       "role": "roles/xyz",
  #       "condition": "service.startsWith("service-name")"
  # },
  # }
  merged_policies = flatten(
    [for dep2pol in local.dependency_to_policy_map :
      [for policy in dep2pol.policies :
    { "${dep2pol.dependency}-${policy}" = lookup(local.connections, dep2pol.dependency, null)["data"]["security"]["iam"][policy] }]]
  )
  # array of objects to map, so we can for_each over it
  merged_policies_map = merge(local.merged_policies...)
}
