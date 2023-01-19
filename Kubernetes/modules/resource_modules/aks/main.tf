### AKS ###

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.aks_cluster_name
  resource_group_name     = var.rg01_name
  location                = var.rg_location
  dns_prefix              = var.aks_cluster_name
  kubernetes_version      = var.aks_version
  node_resource_group     = var.aks_default_nodepool_resource_group_name
  private_cluster_enabled = var.aks_private_cluster_enabled
  tags                    = var.tags


  api_server_authorized_ip_ranges = var.aks_server_authorised_ip_ranges

  default_node_pool {
    name                 = var.aks_default_nodepool_name
    vm_size              = var.aks_default_nodepool_vm_size
    vnet_subnet_id       = var.subnet01
    type                 = var.aks_default_nodepool_type
    os_disk_size_gb      = var.aks_default_nodepool_os_disk_size_gb
    enable_auto_scaling  = var.aks_default_nodepool_enable_autoscaling
    min_count            = var.aks_default_nodepool_min_count
    max_count            = var.aks_default_nodepool_max_count
    max_pods             = var.aks_default_nodepool_max_pods
    orchestrator_version = var.aks_version
  }

  linux_profile {
    admin_username = var.aks_linux_username

    ssh_key {
      key_data = var.aks_ssh_key
    }
  }

  role_based_access_control {
    enabled = var.aks_rbac_enabled

    azure_active_directory   {
      tenant_id              = var.tenant_id
      managed                = var.aks_rbac_managed
      admin_group_object_ids = var.aks_admin_group_ids
    }
  }

  service_principal {
    client_id     = var.aks_service_principal_id
    client_secret = var.aks_service_principal_secret
  }

  network_profile {
    network_plugin     = var.aks_network_plugin
    docker_bridge_cidr = var.aks_network_profile_docker_bridge_cidr
    service_cidr       = var.aks_network_profile_service_cidr
    dns_service_ip     = var.aks_network_profile_dns_service_ip
    outbound_type      = var.aks_outbound_type
    load_balancer_sku  = var.aks_load_balancer_sku
    
  }

}

