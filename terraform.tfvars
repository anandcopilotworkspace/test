aks_clusters = {
  example = {
    location = "eastus"
    name     = "aks-prod-cluster"
    network = {
      node_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
      pod_cidr       = "10.244.0.0/16"
    }
    resource_group_name             = "example-rg"
    rbac_aad_admin_group_object_ids = ["00000000-0000-0000-0000-000000000000"]
  }
}
