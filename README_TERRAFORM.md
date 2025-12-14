# Azure Resource Group Terraform Configuration

This repository contains Terraform configuration files to deploy multiple Azure Resource Groups using the Azure Verified Module (AVM).

## Files

### main.tf
The main Terraform configuration file that:
- Uses the official AVM module: `Azure/avm-res-resources-resourcegroup/azurerm` version 0.2.1
- Implements `for_each` pattern to create multiple resource groups from a map
- Passes all required and optional fields to the module
- Uses `try()` function for optional fields to handle null values gracefully

### variables.tf
Defines the input variable schema:
- `resource_groups`: A map of resource group configurations
- **Required fields**: `name` and `location`
- **Optional fields**: `enable_telemetry`, `lock`, `role_assignments`, `tags`
- All types match the AVM module specification exactly

### terraform.tfvars
Example values file with:
- Two sample resource groups
- Only required fields included (name and location)
- Optional fields can be added per resource group as needed

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Validate configuration:**
   ```bash
   terraform validate
   ```

3. **Plan deployment:**
   ```bash
   terraform plan
   ```

4. **Apply configuration:**
   ```bash
   terraform apply
   ```

## Customization

### Adding More Resource Groups
Edit `terraform.tfvars` to add more resource groups to the map:

```hcl
resource_groups = {
  "rg1" = {
    name     = "rg-example-001"
    location = "eastus"
  }
  "rg2" = {
    name     = "rg-example-002"
    location = "westus"
  }
  "rg3" = {
    name     = "rg-example-003"
    location = "centralus"
    tags = {
      Environment = "Production"
      Owner       = "DevOps"
    }
  }
}
```

### Adding Optional Fields

#### Tags Example:
```hcl
"rg1" = {
  name     = "rg-example-001"
  location = "eastus"
  tags = {
    Environment = "Production"
    CostCenter  = "Engineering"
  }
}
```

#### Lock Example:
```hcl
"rg1" = {
  name     = "rg-example-001"
  location = "eastus"
  lock = {
    kind = "CanNotDelete"
    name = "prevent-deletion"
  }
}
```

#### Role Assignments Example:
```hcl
"rg1" = {
  name     = "rg-example-001"
  location = "eastus"
  role_assignments = {
    "reader" = {
      role_definition_id_or_name = "Reader"
      principal_id               = "00000000-0000-0000-0000-000000000000"
    }
  }
}
```

## Module Documentation

For more information about the AVM Resource Group module:
- [Terraform Registry](https://registry.terraform.io/modules/Azure/avm-res-resources-resourcegroup/azurerm/latest)
- [GitHub Repository](https://github.com/Azure/terraform-azurerm-avm-res-resources-resourcegroup)

## Requirements

- Terraform >= 1.9
- Azure Provider >= 3.71, < 5.0.0
- Valid Azure credentials configured
