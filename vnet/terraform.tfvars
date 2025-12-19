virtual_networks = {
  production = {
    location      = "eastus"
    parent_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/prod-network-rg"
    address_space = ["10.0.0.0/16"]
  }
}
