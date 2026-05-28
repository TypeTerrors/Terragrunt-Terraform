# Terraform is responsible for the resource implementation.
# Terragrunt does not create Azure resources directly; it only passes inputs into this module.
locals {
    # The module can either accept a caller-supplied name or derive one from shared naming parts.
    resource_group_name = coalesce(
        var.name,
        "rg-${var.workflow_name}-${var.stage_name}-${var.location_code}"
    )
}

resource "azurerm_resource_group" "this" {
    name     = local.resource_group_name
    location = var.location
    tags     = var.tags
}
