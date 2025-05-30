module "yaml_importer" {
  source = "./modules/yaml_importer"

  configuration_path = "${path.root}/configuration"

  # Valid
  dns_records_manifest_name = "dns_records.yaml"

  # Will throw an error
  # dns_records_manifest_name = "dns_records_with_error.yaml"
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record
resource "cloudflare_dns_record" "this" {
  # Double dns_records because it is the name of the output and level 1 within the object
  for_each = { for i, o in module.yaml_importer.dns_records.dns_records : o.name => o }

  zone_id = var.zone_id

  name    = each.value.name
  type    = each.value.type
  content = each.value.content

  ttl     = 1
  comment = "Managed by OpenTofu"
}
