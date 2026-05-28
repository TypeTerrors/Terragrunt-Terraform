locals {
    module_repo = "git::ssh://git@github.com/your-org"
    module_version - "v1.0.0"
}

terraform {
    extra_arguments "disable_input" {
        commands = get_terraform_commands_that_need_input()
        arguments = ["-input=false"]
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwirte_terragrunt"
    contents = <<-EOF
        provider "azurerm" {
            features {}
        }
    EOF
}