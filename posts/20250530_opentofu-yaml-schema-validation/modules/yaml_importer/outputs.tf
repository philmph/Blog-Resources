output "dns_records" {
  value       = module.dns_records.output
  description = "Schema validated DNS records imported from YAML configuration"
}
