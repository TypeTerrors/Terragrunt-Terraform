# Consumer Example

This folder shows the team that consumes reusable modules through Terragrunt.

## Purpose

Consumer teams usually work with Terragrunt more than creator teams do. That is because the consumer team is responsible for:

- loading environment data from shared configuration
- selecting the module source and version
- passing inputs into the module
- deciding whether to accept defaults or override specific settings

## Start Here

Look at these files first:

- `TypeTerrors.hcl`
- `resource-group/terragrunt.hcl`
- `storage-account/terragrunt.hcl`
- `storage-account-override/terragrunt.hcl`

## What This Example Demonstrates

- The module source comes from a shared module repository instead of a local path
- The module version is pinned in one place
- `TypeTerrors.hcl` holds the environment values shared across the consumer units
- `resource-group` uses the default module inputs
- `storage-account` uses a Terragrunt `dependency` block to read the resource group output
- `storage-account-override` shows how to override optional settings when needed

## Why the Module Source Points Back to the Example Repo

In a real organization, the consumer repository is usually separate from the module repository.

In this teaching example, the consumer points back to the module path inside the same repo so the relationship is easier to understand.

Before using this pattern in a live environment, replace the placeholder module source in the Terragrunt config with your real repository and module tag or release reference.

## Prerequisites

- Install Terraform
- Install Terragrunt
- Authenticate to Azure before running plans

For local use, Azure CLI authentication is usually the simplest starting point.

## Key Takeaway

The consumer team is not rewriting the Terraform module. The consumer team is only deciding how to call the approved module from their environment.
