output "current_kubernetes_version" {
  description = "The current version running on the Azure Kubernetes Managed Cluster"
  value       = { for k, v in module.aks_production : k => v.current_kubernetes_version }
}

output "fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster"
  value       = { for k, v in module.aks_production : k => v.fqdn }
}

output "http_application_routing_zone_name" {
  description = "The Zone Name of the HTTP Application Routing"
  value       = { for k, v in module.aks_production : k => v.http_application_routing_zone_name }
}

output "identity_principal_id" {
  description = "The Principal ID associated with this Managed Service Identity"
  value       = { for k, v in module.aks_production : k => v.identity_principal_id }
}

output "identity_tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity"
  value       = { for k, v in module.aks_production : k => v.identity_tenant_id }
}

output "ingress_application_gateway_identity_client_id" {
  description = "The Client ID of the user-defined Managed Identity used by the Application Gateway"
  value       = { for k, v in module.aks_production : k => v.ingress_application_gateway_identity_client_id }
}

output "ingress_application_gateway_identity_object_id" {
  description = "The Object ID of the user-defined Managed Identity used by the Application Gateway"
  value       = { for k, v in module.aks_production : k => v.ingress_application_gateway_identity_object_id }
}

output "ingress_application_gateway_identity_user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity used by the Application Gateway"
  value       = { for k, v in module.aks_production : k => v.ingress_application_gateway_identity_user_assigned_identity_id }
}

output "key_vault_secrets_provider_secret_identity_client_id" {
  description = "The Client ID of the user-defined Managed Identity used by the Secret Provider"
  value       = { for k, v in module.aks_production : k => v.key_vault_secrets_provider_secret_identity_client_id }
}

output "key_vault_secrets_provider_secret_identity_object_id" {
  description = "The Object ID of the user-defined Managed Identity used by the Secret Provider"
  value       = { for k, v in module.aks_production : k => v.key_vault_secrets_provider_secret_identity_object_id }
}

output "key_vault_secrets_provider_secret_identity_user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity used by the Secret Provider"
  value       = { for k, v in module.aks_production : k => v.key_vault_secrets_provider_secret_identity_user_assigned_identity_id }
}

output "kube_admin_config" {
  description = "The kube_admin_config block for the Azure Kubernetes Managed Cluster"
  value       = { for k, v in module.aks_production : k => v.kube_admin_config }
  sensitive   = true
}

output "kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account"
  value       = { for k, v in module.aks_production : k => v.kube_admin_config_raw }
  sensitive   = true
}

output "kube_config" {
  description = "The kube_config block for the Azure Kubernetes Managed Cluster"
  value       = { for k, v in module.aks_production : k => v.kube_config }
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw Kubernetes config for the user account"
  value       = { for k, v in module.aks_production : k => v.kube_config_raw }
  sensitive   = true
}

output "kubelet_identity_client_id" {
  description = "The Client ID of the user-defined Managed Identity assigned to the Kubelets"
  value       = { for k, v in module.aks_production : k => v.kubelet_identity_client_id }
}

output "kubelet_identity_object_id" {
  description = "The Object ID of the user-defined Managed Identity assigned to the Kubelets"
  value       = { for k, v in module.aks_production : k => v.kubelet_identity_object_id }
}

output "kubelet_identity_user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity assigned to the Kubelets"
  value       = { for k, v in module.aks_production : k => v.kubelet_identity_user_assigned_identity_id }
}

output "load_balancer_profile_effective_outbound_ips" {
  description = "The effective outbound IPs for the load balancer profile"
  value       = { for k, v in module.aks_production : k => v.load_balancer_profile_effective_outbound_ips }
}

output "nat_gateway_profile_effective_outbound_ips" {
  description = "The effective outbound IPs for the NAT Gateway profile"
  value       = { for k, v in module.aks_production : k => v.nat_gateway_profile_effective_outbound_ips }
}

output "network_profile" {
  description = "The network profile block for the Kubernetes cluster"
  value       = { for k, v in module.aks_production : k => v.network_profile }
}

output "node_resource_group" {
  description = "The auto-generated Resource Group containing resources for the Managed Kubernetes Cluster"
  value       = { for k, v in module.aks_production : k => v.node_resource_group }
}

output "node_resource_group_id" {
  description = "The ID of the Resource Group containing resources for the Managed Kubernetes Cluster"
  value       = { for k, v in module.aks_production : k => v.node_resource_group_id }
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster"
  value       = { for k, v in module.aks_production : k => v.oidc_issuer_url }
}

output "oms_agent_identity_client_id" {
  description = "The Client ID of the user-defined Managed Identity used by the OMS Agents"
  value       = { for k, v in module.aks_production : k => v.oms_agent_identity_client_id }
}

output "oms_agent_identity_object_id" {
  description = "The Object ID of the user-defined Managed Identity used by the OMS Agents"
  value       = { for k, v in module.aks_production : k => v.oms_agent_identity_object_id }
}

output "oms_agent_identity_user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity used by the OMS Agents"
  value       = { for k, v in module.aks_production : k => v.oms_agent_identity_user_assigned_identity_id }
}

output "portal_fqdn" {
  description = "The FQDN for the Azure Portal resources when private link has been enabled"
  value       = { for k, v in module.aks_production : k => v.portal_fqdn }
}

output "private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled"
  value       = { for k, v in module.aks_production : k => v.private_fqdn }
}

output "resource_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = { for k, v in module.aks_production : k => v.resource_id }
}

output "web_app_routing_web_app_routing_identity_client_id" {
  description = "The Client ID of the user-defined Managed Identity used for Web App Routing"
  value       = { for k, v in module.aks_production : k => v.web_app_routing_web_app_routing_identity_client_id }
}

output "web_app_routing_web_app_routing_identity_object_id" {
  description = "The Object ID of the user-defined Managed Identity used for Web App Routing"
  value       = { for k, v in module.aks_production : k => v.web_app_routing_web_app_routing_identity_object_id }
}

output "web_app_routing_web_app_routing_identity_user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity used for Web App Routing"
  value       = { for k, v in module.aks_production : k => v.web_app_routing_web_app_routing_identity_user_assigned_identity_id }
}
