# This is plain Terraform owned by the creator side.
# Terragrunt calls this module, but the provider and version contract live here.
terraform {
    required_version = ">= 1.7.0"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.74"
        }
    }
}
