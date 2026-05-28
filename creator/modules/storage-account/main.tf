# Terraform owns resource creation and naming logic inside the module.
# Terragrunt decides which values to send, but the storage account is declared here.
locals {
    # The module derives a predictable default storage account name from environment-specific parts.
    generated_name      = lower(substr("st${var.workload_code}_${var.location_code}_${var.stage_code}-${var.instance}", 0, 24))
    storage_account_name = coalesce(var.name, local.generated_name)
}

resource "azurerm_storage_account" "this" {
    name                          = local.generated_name
    resource_group_name           = var.resource_group_name
    location                      = var.location
    account_tier                  = var.account_tier
    account_replication_type       = var.account_replication_type
    min_tls_version               = var.min_tls_version
    public_network_access_enabled = var.public_network_access_enable
    https_traffic_only_enabled    = true
    tags                          = var.tags
}
