locals {
  dns_records_from_yaml = { for i, o in local.yaml_data.dns_records : o.name => o }
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record
resource "cloudflare_dns_record" "this" {
  for_each = local.dns_records_from_yaml

  zone_id = var.zone_id

  name    = each.value.name
  type    = each.value.type
  content = each.value.content

  ttl     = 1
  comment = "Managed by OpenTofu"
}
