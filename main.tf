terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

module "aks" {
  source   = "Azure/avm-ptn-aks-production/azurerm"
  for_each = var.aks_clusters

  location            = each.value.location
  name                = each.value.name
  network             = each.value.network
  resource_group_name = each.value.resource_group_name

  acr                             = try(each.value.acr, null)
  agents_tags                     = try(each.value.agents_tags, {})
  default_node_pool_vm_sku        = try(each.value.default_node_pool_vm_sku, "Standard_D4d_v5")
  enable_telemetry                = try(each.value.enable_telemetry, true)
  kubernetes_version              = try(each.value.kubernetes_version, null)
  lock                            = try(each.value.lock, null)
  managed_identities              = try(each.value.managed_identities, {})
  monitor_metrics                 = try(each.value.monitor_metrics, null)
  network_policy                  = try(each.value.network_policy, "cilium")
  node_labels                     = try(each.value.node_labels, {})
  node_pools                      = try(each.value.node_pools, {})
  orchestrator_version            = try(each.value.orchestrator_version, null)
  os_disk_type                    = try(each.value.os_disk_type, "Managed")
  os_sku                          = try(each.value.os_sku, "AzureLinux")
  outbound_type                   = try(each.value.outbound_type, "loadBalancer")
  private_dns_zone_id             = try(each.value.private_dns_zone_id, null)
  private_dns_zone_id_enabled     = try(each.value.private_dns_zone_id_enabled, false)
  rbac_aad_admin_group_object_ids = try(each.value.rbac_aad_admin_group_object_ids, null)
  rbac_aad_azure_rbac_enabled     = try(each.value.rbac_aad_azure_rbac_enabled, null)
  rbac_aad_tenant_id              = try(each.value.rbac_aad_tenant_id, null)
  tags                            = try(each.value.tags, null)
}
