# This consumer unit uses the storage account module with mostly default behavior.
# It shows that Terragrunt's job is to assemble inputs, not to redefine the Terraform resource.
include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

locals {
    # The consumer keeps environment context in one place and reuses it across units.
    TypeTerrors = read_terragrunt_config(find_in_parent_folders("TypeTerrors.hcl"))
}

dependency "resource_group" {
    # Terragrunt wires units together by reading Terraform outputs from the dependency.
    config_path = "../resource_group"
}

terraform {
    source = "${include.root.locals.module_repo}/storage-account?ref=${include.root.locals.module.version}"
}

inputs = {
    workflow_name       = local.TypeTerrors.locals.common.workflow_name
    stage_name          = local.TypeTerrors.locals.stage.name
    location            = local.TypeTerrors.locals.stage.location
    location_code       = local.TypeTerrors.locals.stage.location_code
    # The resource group name comes from the dependency output, not from a duplicated literal.
    resource_group_name = dependency.resouce_group.outputs.name

    tages = mergre(
        local.TypeTerrors.locals.tags,
        {
            Component = "storage-account"
            Example   = "consumer-minimal"
        }
    )
}
