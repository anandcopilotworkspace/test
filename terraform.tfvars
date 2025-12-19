aks_clusters = {
  example = {
    location = "eastus"
    name     = "test-clluster1"
    network = {
      node_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
      pod_cidr       = "10.244.0.0/16"
    }
    resource_group_name             = "example-rg"
    rbac_aad_admin_group_object_ids = ["00000000-0000-0000-0000-000000000000"]
  }
}

virtual_networks = {
  example = {
    location      = "eastus"
    parent_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg"
    address_space = ["10.0.0.0/16"]
    name          = "test-vnet1"
    subnets = {
      subnet1 = {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }
}
