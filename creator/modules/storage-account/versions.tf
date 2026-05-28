# This is a creator-owned Terraform module.
# Terragrunt orchestrates how the module is called, while Terraform defines the actual Azure resource behavior.
terraform {
    required_version = ">= 1.7.0"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.74"
        }
    }
}
