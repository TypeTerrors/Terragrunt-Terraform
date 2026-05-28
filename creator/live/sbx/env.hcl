# Terragrunt centralizes environment data in HCL locals like this file.
# Terraform modules do not read this file directly; Terragrunt reads it and maps values into module inputs.
locals {
    stage = {
        name          = "sbx"
        location      = "canadacentral"
        location_code = "cc1"
    }

    common = {
        # Shared naming parts can be reused by multiple units in the same environment.
        workload_name = "payments"
        workload_code = "pay"
    }

    tags = {
        Environment = "SBX"
        ManagedBy = "Terragrunt"
        Owner       = "TypeTerrors"
        Stage       = "SBX"
    }
}
