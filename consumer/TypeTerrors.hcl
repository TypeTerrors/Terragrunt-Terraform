# This file represents consumer-owned environment data.
# Consumer teams usually change files like this, while the creator team keeps the Terraform module code stable.
locals {
    stage = {
        name          = "sbx"
        location      = "canadacentral"
        location_code = "cc1"
    }
    common = {
        workflow_name = "testing_features"
        workflow_code = "test"
    }
    tags = {
        Environment = "SBX"
        ManagedBy   = "Terragrunt"
        Owner       = "TypeTerrors"
        Stage       = "SBX"
    }
}
