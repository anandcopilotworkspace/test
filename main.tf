module "resource_group" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  for_each = var.resource_groups

  location         = each.value.location
  name             = each.value.name
  enable_telemetry = try(each.value.enable_telemetry, true)
  lock             = try(each.value.lock, null)
  role_assignments = try(each.value.role_assignments, {})
  tags             = try(each.value.tags, null)
}
