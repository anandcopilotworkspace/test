# Terraform Wrapper Module for Azure AKS Production

This Terraform module wraps the Azure Verified Module (AVM) for AKS Production environments.

## Module Source

```hcl
source = "Azure/avm-ptn-aks-production/azurerm"
```

## Usage

See `terraform.tfvars.example` for a minimal valid configuration example.

## Features

- Supports multiple AKS cluster instances using `for_each`
- Exposes all AVM module outputs
- Mirrors AVM default values for easy override
- Follows Azure Verified Modules wrapper standards

## Required Variables

- `location`: Azure region for deployment
- `name`: AKS cluster name
- `network`: Network configuration with node_subnet_id and pod_cidr
- `resource_group_name`: Resource group name

## Optional Variables

All other AVM module variables are supported as optional attributes with their original defaults.
