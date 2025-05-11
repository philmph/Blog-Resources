locals {
  yaml_path     = "${path.root}/configuration"
  yaml_filename = "dns_records.yaml"
  yaml_data     = yamldecode(file("${local.yaml_path}/${local.yaml_filename}"))

  transformed_yaml = { for i, o in local.yaml_data.dns_records : o.name => o }
}
