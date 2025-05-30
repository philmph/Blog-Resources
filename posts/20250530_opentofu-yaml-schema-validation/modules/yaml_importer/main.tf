locals {
  yaml_manifests = { for i, o in fileset(var.configuration_path, "**/*.yaml") : o => yamldecode(file("${var.configuration_path}/${o}")) }
}

module "dns_records" {
  source = "./dns_records"

  input = local.yaml_manifests[var.dns_records_manifest_name]
}
