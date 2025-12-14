terraform {
  required_version = ">= 1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_groups" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  for_each = var.resource_groups

  # Required inputs
  name     = each.value.name
  location = each.value.location

  # Optional inputs
  enable_telemetry = try(each.value.enable_telemetry, null)
  lock             = try(each.value.lock, null)
  role_assignments = try(each.value.role_assignments, null)
  tags             = try(each.value.tags, null)
}
