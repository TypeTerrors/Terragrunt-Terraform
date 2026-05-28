# These outputs are intended for downstream callers.
# In Terragrunt, another unit can read them through a dependency block.
output "id" {
    description = "value"
    value       = azurerm_storage_account.this.id
}

output "name" {
    value       = azurerm_storage_account.this.name
    description = "value"
}

output "primary_blob_endpoint" {
    value = azurerm_storage_account.this.primary_blob_endpoint
}
