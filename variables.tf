variable "aks_clusters" {
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
    agents_tags = optional(map(string))
    default_node_pool_vm_sku = optional(string)
    enable_telemetry = optional(bool)
    kubernetes_version = optional(string)
    lock = optional(object({
      kind = string
      name = optional(string)
    }))
    managed_identities = optional(object({
      system_assigned            = optional(bool)
      user_assigned_resource_ids = optional(set(string))
    }))
    monitor_metrics = optional(object({
      annotations_allowed = optional(string)
      labels_allowed      = optional(string)
    }))
    network_policy = optional(string)
    node_labels = optional(map(string))
    node_pools = optional(map(object({
      name                 = string
      vm_size              = string
      orchestrator_version = string
      max_count            = optional(number)
      min_count            = optional(number)
      os_sku               = optional(string)
      os_disk_type         = optional(string)
      mode                 = optional(string)
      os_disk_size_gb      = optional(number)
      tags                 = optional(map(string))
      labels               = optional(map(string))
    })))
    orchestrator_version = optional(string)
    os_disk_type = optional(string)
    os_sku = optional(string)
    outbound_type = optional(string)
    private_dns_zone_id = optional(string)
    private_dns_zone_id_enabled = optional(bool)
    rbac_aad_admin_group_object_ids = optional(list(string))
    rbac_aad_azure_rbac_enabled = optional(bool)
    rbac_aad_tenant_id = optional(string)
    tags = optional(map(string))
  }))
  description = "A map of AKS cluster configurations to create"
}
