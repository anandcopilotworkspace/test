variable "resource_groups" {
  description = "Map of resource groups to create. Each key is a unique identifier for the resource group."
  type = map(object({
    # Required inputs
    name     = string
    location = string

    # Optional inputs
    enable_telemetry = optional(bool)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
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
    tags = optional(map(string))
  }))
}
