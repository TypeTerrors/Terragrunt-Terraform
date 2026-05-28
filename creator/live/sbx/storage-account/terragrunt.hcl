# This Terragrunt unit shows the second half of the example: one module consuming another module's output.
# The storage account module is still plain Terraform, but Terragrunt handles the dependency wiring.
include "root" {
    path = find_in_parent_folders("root.hcl")
}

locals {
    # Shared environment values are loaded here and then mapped into Terraform variables below.
    env_cfg = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

dependency "resource_group" {
    # Terragrunt reads outputs from the resource-group unit so this unit does not duplicate that value.
    config_path = "../resource-group"
}

terraform {
    source = "../../../modules/storage-account"
}

inputs = {
    workload_name       = local.env_cfg.locals.common.workflow_name
    stage_name          = local.env_cfg.locals.stage.name
    location            = local.env_cfg.locals.stage.location
    location_code       = local.env_cfg.locals.location_code
    # The dependency output becomes an input to the Terraform module.
    resouce_group_name = dependency.resource_group.outputs.name

    tags = merge(
        local.env_cfg.locals.tags,
        {
            Component = "storage-account"
            Example   = "creator"
        }
    )
}
