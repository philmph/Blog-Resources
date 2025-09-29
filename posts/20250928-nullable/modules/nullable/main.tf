variable "not_nullable_with_default" {
  default  = "default"
  nullable = false
  type     = string
}

variable "not_nullable_without_default" {
  nullable = false
  type     = string
}

variable "nullable_with_default" {
  default  = "default"
  nullable = true # This is the default
  type     = string
}

variable "nullable_without_default" {
  nullable = true # This is the default
  type     = string
}

output "all" {
  value = {
    not_nullable_with_default    = var.not_nullable_with_default
    not_nullable_without_default = var.not_nullable_without_default
    nullable_with_default        = var.nullable_with_default
    nullable_without_default     = var.nullable_without_default
  }
}
