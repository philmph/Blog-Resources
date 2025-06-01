locals {
  # Root folder where all configuration files are located
  configuration_path = "${path.root}/configuration"

  # Load all yaml configuration files
  yaml_configurations = { for i, o in fileset(local.configuration_path, "**/*.yaml") :
    o => yamldecode(file("${local.configuration_path}/${o}"))
  }

  # Valid
  configuration_name_dns_records = "dns_records.yaml"

  # TRYME: Will throw an error
  # configuration_name_dns_records = "dns_records_with_error.yaml"
}

module "yaml_validation_dns_records" {
  source = "./yaml-validation/dns-records"

  input = local.yaml_configurations[local.configuration_name_dns_records]
}
