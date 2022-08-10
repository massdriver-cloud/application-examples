output "params" {
  value = local.params
}

output "connections" {
  value = local.connections
}

output "app_specification" {
  value = local.app_specification
}

output "result_envs" {
  value = local.result_envs
}

output "merged_policies" {
  value = local.merged_policies_map
}

output "helm_chart" {
  value = local.helm_chart
}

output "helm_additional_values" {
  value = local.helm_additional_values
}
