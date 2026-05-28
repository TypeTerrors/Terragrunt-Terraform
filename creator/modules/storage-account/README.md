# Storage Account Module

This module creates an Azure storage account.

## Why This Module Exists

This is more than a thin wrapper around a single resource. It adds a few useful defaults and guardrails:

- naming rules
- default TLS settings
- default replication settings
- a small override surface for consumers

## Inputs

Required inputs:

- `workload_code`
- `stage_code`
- `location`
- `location_code`
- `resource_group_name`

Optional inputs:

- `name`
- `instance`
- `account_tier`
- `account_replication_type`
- `min_tls_version`
- `public_network_access_enable`
- `tags`

## Outputs

- `id`
- `name`
- `primary_blob_endpoint`

## Important Notes

Storage account names must be globally unique in Azure. If the generated name is already taken, the consumer should provide a `name` override.
