module "basic_usage" {
  source = "./modules/nullable"

  not_nullable_with_default    = null
  not_nullable_without_default = "module"
  nullable_with_default        = null
  nullable_without_default     = null

  # not_nullable_without_default = null
}

output "basic_usage" {
  value = module.basic_usage
}

# Loop example
variable "loop" {
  type = map(object({
    not_nullable_with_default    = optional(string)
    not_nullable_without_default = optional(string)
    nullable_with_default        = optional(string)
    nullable_without_default     = optional(string)
  }))
}

module "loop" {
  source = "./modules/nullable"

  for_each = var.loop

  not_nullable_with_default    = each.value.not_nullable_with_default
  not_nullable_without_default = each.value.not_nullable_without_default
  nullable_with_default        = each.value.nullable_with_default
  nullable_without_default     = each.value.nullable_without_default
}

output "loop" {
  value = module.loop
}
