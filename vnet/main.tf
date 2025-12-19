module "virtual_network" {
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"
  for_each = var.virtual_networks

  location                = each.value.location
  parent_id               = each.value.parent_id
  address_space           = each.value.address_space
  bgp_community           = each.value.bgp_community
  ddos_protection_plan    = each.value.ddos_protection_plan
  diagnostic_settings     = each.value.diagnostic_settings
  dns_servers             = each.value.dns_servers
  enable_telemetry        = each.value.enable_telemetry
  enable_vm_protection    = each.value.enable_vm_protection
  encryption              = each.value.encryption
  extended_location       = each.value.extended_location
  flow_timeout_in_minutes = each.value.flow_timeout_in_minutes
  ipam_pools              = each.value.ipam_pools
  lock                    = each.value.lock
  name                    = each.value.name
  peerings                = each.value.peerings
  retry                   = each.value.retry
  role_assignments        = each.value.role_assignments
  subnets                 = each.value.subnets
  tags                    = each.value.tags
  timeouts                = each.value.timeouts
}
