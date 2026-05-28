# This Terragrunt file holds shared orchestration behavior for the creator-side examples.
# The creator still writes Terraform modules, but Terragrunt helps test them consistently.
terraform {
    extra_arguments "disable_input" {
        commands  = get_transform_commands_that_need_input()
        arguments = ["-input=false"]
    }
}

generate "provider" {
    # Generate provider configuration once so each example unit stays focused on module inputs.
    path      = "provider.tf"
    if_exists = "overwirte_terragrunt"
    contents = <<-EOF
        provider "azurerm" {
            features {}
        }
    EOF
}
