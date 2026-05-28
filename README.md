# Terraform and Terragrunt Azure Example

This repository shows two ways of working with the same Azure infrastructure code:

- `creator/`: teams that build reusable Terraform modules
- `consumer/`: teams that consume those modules through Terragrunt

The examples are intentionally small. The goal is to show the workflow, not to model a full production platform.

## What This Project Shows

- How a creator team writes reusable Terraform modules
- How the creator team can still test those modules with Terragrunt and shared environment data
- How a consumer team uses Terragrunt to call modules from a shared source
- How a consumer team starts with defaults and adds overrides only when needed

## Mental Model

Use this explanation when you are teaching the pattern to people who are newer to infrastructure as code:

- Terraform defines the reusable building blocks
- Terragrunt decides how those building blocks are wired for a specific environment

That means:

- Creator teams mostly write Terraform modules
- Consumer teams mostly write Terragrunt configuration
- Terragrunt handles environment values, inheritance, and dependencies

## Modules Included

This example contains two Azure modules:

- `resource-group`
- `storage-account`

They were chosen because they are simple, common, and useful for showing dependency flow.

The `resource-group` module creates the resource group. The `storage-account` module accepts the resource group name as an input. Terragrunt then uses a `dependency` block so the storage account can read the resource group output cleanly.

## Creator Side

The creator side lives under `creator/modules` and is plain Terraform:

- variables
- resources
- outputs
- sensible defaults

The example Terragrunt units under `creator/live` show how a team can test those modules locally while still loading shared environment context from `env.hcl`.

On the creator side, the module source is a local file path because the modules live in the same repository.

## Consumer Side

The consumer side shows how a team uses Terragrunt to consume published modules instead of calling a child module directly from a root Terraform configuration.

In this pattern, the consumer Terragrunt files:

- include shared settings from a `root.hcl`
- read environment data from `TypeTerrors.hcl`
- point to the module source through `terraform.source`
- pass the required inputs into the module

That is why the consumer side has more Terragrunt logic than the creator side.

## Defaults vs Overrides

The consumer examples show both patterns:

- `consumer/storage-account/terragrunt.hcl` uses the module with mostly defaults
- `consumer/storage-account-override/terragrunt.hcl` shows how to override optional settings such as the storage account name, replication type, and public network access

## How to Explain It Quickly

If you need the short version:

- The platform team builds approved Terraform modules once
- The consumer team points Terragrunt at those approved modules
- Terragrunt loads the environment values and passes them into Terraform
- The consumer only overrides settings when there is a real reason to do so

## Getting Started

1. Install Terraform and Terragrunt.
2. Authenticate to Azure.
3. Review the creator examples first.
4. Review the consumer examples next.

## Azure Authentication

For local use, Azure CLI authentication is usually the simplest starting point.
