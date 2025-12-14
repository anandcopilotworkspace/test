## AVM Wrapper Generation Policy

When asked to create Terraform using an Azure Verified Module (AVM):

1. You MUST read the AVM module source (variables.tf) to discover all supported inputs.
2. You MUST identify required vs optional inputs from the module.
3. You MUST generate a Terraform wrapper module (not native azurerm_* resources).
4. The wrapper MUST:
   - Use the Terraform Registry source for the AVM module
   - Use for_each with a map variable to support multiple instances
   - Pass ALL AVM module inputs through
   - Use try(each.value.<field>, null) for optional inputs
5. variables.tf MUST:
   - Define a map(object({ ... })) variable
   - Include ALL AVM inputs
   - Mark required inputs as required
   - Mark optional inputs using optional(...)
6. You MUST NOT:
   - Use azurerm_* resources
   - Omit AVM inputs
   - Generate tutorial or example text
   - Add extra files unless explicitly requested
