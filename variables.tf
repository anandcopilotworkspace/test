variable "aks_production_instances" {
  type = map(object({
    location            = string
    name                = string
    network = object({
      node_subnet_id = string
      pod_cidr       = string
      service_cidr   = optional(string)
      dns_service_ip = optional(string)
    })
    resource_group_name = string
    acr = optional(object({
      name                          = string
      private_dns_zone_resource_ids = set(string)
      subnet_resource_id            = string
      zone_redundancy_enabled       = optional(bool)
    }))
    agents_tags              = optional(map(string), {})
    default_node_pool_vm_sku = optional(string, "Standard_D4d_v5")
    enable_telemetry         = optional(bool, true)
    kubernetes_version       = optional(string)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    monitor_metrics = optional(object({
      annotations_allowed = optional(string)
      labels_allowed      = optional(string)
    }))
    network_policy               = optional(string, "cilium")
    node_labels                  = optional(map(string), {})
    node_pools = optional(map(object({
      name                 = string
      vm_size              = string
      orchestrator_version = string
      max_count            = optional(number)
      min_count            = optional(number)
      os_sku               = optional(string, "AzureLinux")
      os_disk_type         = optional(string, "Managed")
      mode                 = optional(string)
      os_disk_size_gb      = optional(number, null)
      tags                 = optional(map(string), {})
      labels               = optional(map(string), {})
    })), {})
    orchestrator_version            = optional(string)
    os_disk_type                    = optional(string, "Managed")
    os_sku                          = optional(string, "AzureLinux")
    outbound_type                   = optional(string, "loadBalancer")
    private_dns_zone_id             = optional(string)
    private_dns_zone_id_enabled     = optional(bool, false)
    rbac_aad_admin_group_object_ids = optional(list(string))
    rbac_aad_azure_rbac_enabled     = optional(bool)
    rbac_aad_tenant_id              = optional(string)
    tags                            = optional(map(string))
  }))
  description = "Map of AKS production cluster instances to create"
}
