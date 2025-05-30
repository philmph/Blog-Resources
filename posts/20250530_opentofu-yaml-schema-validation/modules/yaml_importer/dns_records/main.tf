variable "input" {
  description = "Input variable for DNS records configuration schema validation"
  type = object({
    dns_records = list(object({
      name    = string
      type    = string
      content = string
    }))
  })

  validation {
    condition = alltrue([
      for record in var.input.dns_records : can(regex("^([a-z0-9\\-]+\\.)+[a-z]+$", record.name))
    ])
    error_message = "All DNS record names must be valid domain names."
  }
}

output "output" {
  value = var.input
}
