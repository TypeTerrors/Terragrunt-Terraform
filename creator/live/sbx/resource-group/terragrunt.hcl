# This Terragrunt unit shows how the creator team can test a local Terraform module.
# The module source is a local path because the module lives in the same repository.
include "root" {
    path = find_in_parent_folders("root.hcl")
}

locals {
    # Load shared environment data once and reuse it when building module inputs.
    env_cfg = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
    source = "../../../modules/resource-group"
}

# Terragrunt is the wiring layer: it reads environment config and passes a clean input map to Terraform.
inputs = {
    workload_name = local.env_cfg.locals.common.workflow_name
    stage_name    = local.env_cfg.locals.stage.name
    location      = local.env_cfg.locals.stage.location
    location_code = local.env_cfg.locals.location_code

    tags = merge(
        local.env_cfg.locals.tags,
        {
            Component = "resouce-group"
            Example   = "creator"
        }
    )
}
