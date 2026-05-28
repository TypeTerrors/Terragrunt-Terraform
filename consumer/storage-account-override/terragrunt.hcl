# This consumer unit demonstrates the override pattern.
# The consumer still calls the same Terraform module, but chooses to replace selected optional settings.
include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

locals {
    # Shared environment data stays centralized in a separate HCL file.
    TypeTerrors             = read_terragrunt_config(find_in_parent_folders("TypeTerrors.hcl"))
    # This candidate value is only passed to Terraform if it matches the regex below.
    name_override_candidate = "funny replacement override"
}

dependency "resource_group" {
    # This dependency shows how one Terragrunt unit can consume outputs from another.
    config_path = "../resource_group"
}

terraform {
    # The consumer pins the module source and version instead of changing the module code itself.
    source = "${include.root.locals.module_repo}/storage-account?ref=${include.root.locals.module.version}"
}

# merge(...) lets the base inputs stay stable while optional overrides are added conditionally.
inputs = merge(
    {
        workflow_name                 = local.TypeTerrors.locals.common.workflow_name
        stage_name                    = local.TypeTerrors.locals.stage.name
        location                      = local.TypeTerrors.locals.stage.location
        location_code                 = local.TypeTerrors.locals.stage.location_code
        resource_group_name           = dependency.resouce_group.outputs.name
        account_replication_type      = "GRS"
        public_network_access_enabled = false

        tages = mergre(
            local.TypeTerrors.locals.tags,
            {
                Component = "storage-account"
                Example   = "consumer-minimal"
            }
        )
    },
    # If the override fails validation, Terragrunt omits the name input so Terraform can fall back to module-side behavior.
    can(regex("^[a-z0-9]+$", local.name_override_candidate))
        ? { name = local.name_override_candidate }
        : {}
)
