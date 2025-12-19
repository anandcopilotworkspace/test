variable "aks_clusters" {
  type = map(object({
    location = string
    name     = string
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
    network_policy = optional(string, "cilium")
    node_labels    = optional(map(string), {})
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
  description = "Map of AKS cluster configurations"
}

variable "virtual_networks" {
  type = map(object({
    location      = string
    parent_id     = string
    address_space = optional(set(string))
    bgp_community = optional(string)
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    dns_servers = optional(object({
      dns_servers = list(string)
    }))
    enable_telemetry     = optional(bool, true)
    enable_vm_protection = optional(bool, false)
    encryption = optional(object({
      enabled     = bool
      enforcement = string
    }))
    extended_location = optional(object({
      name = string
      type = string
    }))
    flow_timeout_in_minutes = optional(number)
    ipam_pools = optional(list(object({
      id            = string
      prefix_length = number
    })))
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
    name = optional(string)
    peerings = optional(map(object({
      name                               = string
      remote_virtual_network_resource_id = string
      allow_forwarded_traffic            = optional(bool, false)
      allow_gateway_transit              = optional(bool, false)
      allow_virtual_network_access       = optional(bool, true)
      do_not_verify_remote_gateways      = optional(bool, false)
      enable_only_ipv6_peering           = optional(bool, false)
      peer_complete_vnets                = optional(bool, true)
      local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      use_remote_gateways                   = optional(bool, false)
      create_reverse_peering                = optional(bool, false)
      reverse_name                          = optional(string)
      reverse_allow_forwarded_traffic       = optional(bool, false)
      reverse_allow_gateway_transit         = optional(bool, false)
      reverse_allow_virtual_network_access  = optional(bool, true)
      reverse_do_not_verify_remote_gateways = optional(bool, false)
      reverse_enable_only_ipv6_peering      = optional(bool, false)
      reverse_peer_complete_vnets           = optional(bool, true)
      reverse_local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_use_remote_gateways        = optional(bool, false)
      sync_remote_address_space_enabled  = optional(bool, false)
      sync_remote_address_space_triggers = optional(any, null)
      timeouts = optional(object({
        create = optional(string, "30m")
        read   = optional(string, "5m")
        update = optional(string, "30m")
        delete = optional(string, "30m")
      }), {})
      retry = optional(object({
        error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned"])
        interval_seconds     = optional(number, 10)
        max_interval_seconds = optional(number, 180)
      }), {})
    })), {})
    retry = optional(object({
      error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned"])
      interval_seconds     = optional(number, 10)
      max_interval_seconds = optional(number, 180)
    }), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    subnets = optional(map(object({
      address_prefix   = optional(string)
      address_prefixes = optional(list(string))
      name             = string
      ipam_pools = optional(list(object({
        pool_id         = string
        prefix_length   = optional(number)
        allocation_type = optional(string, "Static")
      })))
      nat_gateway = optional(object({
        id = string
      }))
      network_security_group = optional(object({
        id = string
      }))
      private_endpoint_network_policies             = optional(string, "Enabled")
      private_link_service_network_policies_enabled = optional(bool, true)
      route_table = optional(object({
        id = string
      }))
      service_endpoint_policies = optional(map(object({
        id = string
      })))
      service_endpoints_with_location = optional(list(object({
        service   = string
        locations = optional(list(string), ["*"])
      })))
      default_outbound_access_enabled = optional(bool, false)
      sharing_scope                   = optional(string, null)
      delegations = optional(list(object({
        name = string
        service_delegation = object({
          name = string
        })
      })))
      timeouts = optional(object({
        create = optional(string, "30m")
        read   = optional(string, "5m")
        update = optional(string, "30m")
        delete = optional(string, "30m")
      }), {})
      retry = optional(object({
        error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned"])
        interval_seconds     = optional(number, 10)
        max_interval_seconds = optional(number, 180)
      }), {})
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))
    })), {})
    tags = optional(map(string))
    timeouts = optional(object({
      create = optional(string, "30m")
      read   = optional(string, "5m")
      update = optional(string, "30m")
      delete = optional(string, "30m")
    }), {})
  }))
  description = "Map of Virtual Network configurations"
}
