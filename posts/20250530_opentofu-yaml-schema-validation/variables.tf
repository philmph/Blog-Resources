variable "cloudflare_api_token" {
  description = "Cloudflare API token with permissions to manage DNS records provided in variable 'zone_id'"
  sensitive   = true
  type        = string
}

variable "zone_id" {
  description = "The ID of the zone to manage DNS records for"
  type        = string
}
