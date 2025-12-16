module "aks" {
  source   = "Azure/avm-ptn-aks-production/azurerm"
  for_each = var.aks_clusters

  location            = each.value.location
  name                = each.value.name
  network             = each.value.network
  resource_group_name = each.value.resource_group_name

  acr                       = each.value.acr
  agents_tags               = coalesce(each.value.agents_tags, {})
  default_node_pool_vm_sku  = each.value.default_node_pool_vm_sku
  enable_telemetry          = each.value.enable_telemetry
  kubernetes_version        = each.value.kubernetes_version
  lock                      = each.value.lock
  managed_identities        = coalesce(each.value.managed_identities, {})
  monitor_metrics           = each.value.monitor_metrics
  network_policy            = each.value.network_policy
  node_labels               = coalesce(each.value.node_labels, {})
  node_pools                = coalesce(each.value.node_pools, {})
  orchestrator_version      = each.value.orchestrator_version
  os_disk_type              = each.value.os_disk_type
  os_sku                    = each.value.os_sku
  outbound_type             = each.value.outbound_type
  private_dns_zone_id       = each.value.private_dns_zone_id
  private_dns_zone_id_enabled = each.value.private_dns_zone_id_enabled
  rbac_aad_admin_group_object_ids = each.value.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled = each.value.rbac_aad_azure_rbac_enabled
  rbac_aad_tenant_id        = each.value.rbac_aad_tenant_id
  tags                      = each.value.tags
}
