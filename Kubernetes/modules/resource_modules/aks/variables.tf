variable "aks_cluster_name" {
    default = ""
}

variable "rg_location" {
    default = ""
}

variable "rg01_name" {
  default = ""
}

variable "aks_version" {
    default = ""
}
variable "aks_default_nodepool_resource_group_name" {
    default = ""
}
variable "aks_private_cluster_enabled" {
    default = ""
}

variable "aks_default_nodepool_name" {
    default = ""
}
variable "aks_default_nodepool_vm_size" {
    default = ""
}
variable "subnet01" {
    default = ""
}
variable "aks_default_nodepool_type" {
    default = ""
}
variable "aks_default_nodepool_os_disk_size_gb" {
    default = ""
}
variable "aks_default_nodepool_enable_autoscaling" {
    default = ""
}
variable "aks_default_nodepool_min_count" {
    default = ""
}
variable "aks_default_nodepool_max_count" {
    default = ""
}
variable "aks_default_nodepool_max_pods" {
    default = ""
}

variable "aks_linux_username" {
    default = ""
}

variable "aks_rbac_enabled" {
    default = ""
}

variable "tenant_id" {
    default = ""
}
variable "aks_rbac_managed" {
    default = ""
}

variable "aks_service_principal_id" {
    default = ""
}
variable "aks_service_principal_secret" {
    default = ""
}

variable "aks_network_plugin" {
    default = ""
}
variable "aks_network_profile_docker_bridge_cidr" {
    default = ""
}
variable "aks_network_profile_service_cidr" {
    default = ""
}
variable "aks_network_profile_dns_service_ip" {
    default = ""
}

variable "aks_server_authorised_ip_ranges" {
    default = ""
}

variable "aks_ssh_key" {
  default = ""
}

variable "aks_outbound_type" {
  default = ""
}

variable "aks_load_balancer_sku" {
  default = ""
}

variable "aks_admin_group_ids" {
  default = ""
}

/*variable "aks_logana_enabled" {
    default = ""
}
variable "aks_logana_id" {
    default = ""
}*/

variable "tags" {
  default = ""
}