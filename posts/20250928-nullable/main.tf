module "basic_usage" {
  source = "./modules/simple"

  not_nullable_with_default    = null
  not_nullable_without_default = "module"
  nullable_with_default        = null
  nullable_without_default     = null

  # not_nullable_without_default = null
}

output "basic_usage" {
  value = module.basic_usage
}
