# Outputs are the hand-off point from Terraform back to callers.
# Terragrunt dependency blocks use outputs like these to wire modules together.
output "id" {
    value       = azurerm_resource_group.this.id
    description = "value"
}

output "location" {
    value       = azurerm_resource_group.this.location
    description = "value"
}

output "name" {
    value       = azurerm_resource_group.this.name
    description = "value"
}
