aks_clusters = {
  production = {
    location            = "eastus"
    name                = "myakscluster"
    resource_group_name = "myresourcegroup"
    network = {
      node_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Network/virtualNetworks/myvnet/subnets/mysubnet"
      pod_cidr       = "10.244.0.0/16"
    }
  }
}
