// Auto-generated variable declarations from massdriver.yaml
variable "budget" {
  type = object({
    email_addresses = optional(list(string))
    limit_amount    = string
  })
  default = null
}
