locals {
  yaml_path     = "${path.root}/configuration"
  yaml_filename = "dns_records.yaml"
  yaml_data     = yamldecode(file("${local.yaml_path}/${local.yaml_filename}"))
}
