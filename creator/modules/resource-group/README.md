# Resource Group Module

This module creates an Azure resource group.

## Why This Module Exists

Even though a resource group is simple, it is still useful to package it as a reusable module when a team wants:

- consistent naming
- consistent tags
- a stable output contract for downstream units

## Inputs

Required inputs:

- `workload_name`
- `stage_name`
- `location`
- `location_code`

Optional inputs:

- `name`
- `tags`

## Outputs

- `id`
- `name`
- `location`
