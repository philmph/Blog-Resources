# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record
resource "cloudflare_dns_record" "this" {
  # Using the output from the yaml_validation_dns_records module. The records are list items within the level 1 `dns_records` key.
  # To be able to use them with for_each, we give them unique identifiers (name) and transform them into objects.
  for_each = { for i, o in module.yaml_validation_dns_records.output.dns_records :
    o.name => o
  }

  zone_id = var.zone_id

  name    = each.value.name
  type    = each.value.type
  content = each.value.content

  ttl     = 1
  comment = "Managed by OpenTofu"
}
