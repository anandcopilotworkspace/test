module "virtual_network" {
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"
  for_each = var.virtual_networks

  location                = each.value.location
  parent_id               = each.value.parent_id
  address_space           = try(each.value.address_space, null)
  bgp_community           = try(each.value.bgp_community, null)
  ddos_protection_plan    = try(each.value.ddos_protection_plan, null)
  diagnostic_settings     = try(each.value.diagnostic_settings, {})
  dns_servers             = try(each.value.dns_servers, null)
  enable_telemetry        = try(each.value.enable_telemetry, true)
  enable_vm_protection    = try(each.value.enable_vm_protection, false)
  encryption              = try(each.value.encryption, null)
  extended_location       = try(each.value.extended_location, null)
  flow_timeout_in_minutes = try(each.value.flow_timeout_in_minutes, null)
  ipam_pools              = try(each.value.ipam_pools, null)
  lock                    = try(each.value.lock, null)
  name                    = try(each.value.name, null)
  peerings                = try(each.value.peerings, {})
  retry                   = try(each.value.retry, {})
  role_assignments        = try(each.value.role_assignments, {})
  subnets                 = try(each.value.subnets, {})
  tags                    = try(each.value.tags, null)
  timeouts                = try(each.value.timeouts, {})
}
