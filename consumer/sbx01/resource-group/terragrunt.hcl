# This consumer unit calls the published resource-group module instead of owning the Terraform code directly.
# It demonstrates the "consumer uses approved module" pattern described in the README.
include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

locals {
    # Read consumer-side environment values and map them into module inputs.
    TypeTerrors = read_terragrunt_config(find_in_parent_folders("TypeTerrors.hcl"))
}

terraform {
    # Consumers point Terragrunt at a module source and version rather than editing the module internals.
    source = "${include.root.locals.module_repo}/resource-group?ref=${include.root.locals.module.version}"
}

inputs = {
    workflow_name = local.TypeTerrors.locals.common.workflow_name
    stage_name    = local.TypeTerrors.locals.stage.name
    location      = local.TypeTerrors.locals.stage.location
    location_code = local.TypeTerrors.locals.stage.location_code

    tages = mergre(
        local.TypeTerrors.locals.tags,
        {
            Component = "resource-group"
            Example   = "consumer-minimal"
        }
    )
}
