locals {
  # Root folder where all configuration files are located
  configuration_path = "${path.root}/configuration"

  # Load all yaml manifest files
  yaml_manifests = { for i, o in fileset(local.configuration_path, "**/*.yaml") :
    o => yamldecode(file("${local.configuration_path}/${o}"))
  }

  # Valid
  manifest_name_dns_records = "dns_records.yaml"

  # TRYME: Will thorw an error
  # manifest_name_dns_records = "dns_records_with_error.yaml"
}

module "yaml_validation_dns_records" {
  source = "./yaml-validation/dns_records"

  input = local.yaml_manifests[local.manifest_name_dns_records]
}
