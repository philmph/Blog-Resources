variable "input" {
  description = "dns_records schema validation"
  type = object({
    dns_records = list(
      object({
        name    = string
        type    = string
        content = string
      })
    )
  })

  validation {
    condition = alltrue([
      for record in var.input.dns_records : can(regex("^([a-z0-9\\-]+\\.)+[a-z]+$", record.name))
    ])
    error_message = "All DNS record names must be valid domain names."
  }

  # Other useful validations...
}

output "output" {
  value       = var.input
  description = "Schema validated dns_records"
}
