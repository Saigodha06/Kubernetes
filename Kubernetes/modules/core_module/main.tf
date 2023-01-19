### VNet & Subnet ###

module "vnet" {
  source = "./../resource_modules/vnet"

  rg01_name                = var.tfvars.rg01_name
  rg_location              = var.tfvars.rg_location
  vnet01_name              = var.tfvars.vnet01_name
  vnet01_address_space     = var.tfvars.vnet_address_space
  subnet01_name            = var.tfvars.subnet01_name
  subnet01_address_prefix  = var.tfvars.subnet01_address_prefix
  subnet02_name            = var.tfvars.subnet02_name
  subnet02_address_prefix  = var.tfvars.subnet02_address_prefix
  nsg01_name               = var.tfvars.nsg01_name
  nsg02_name               = var.tfvars.nsg02_name
  subnet_service_endpoints = var.tfvars.subnet_service_endpoints
  tags                     = var.tfvars.tags
  ddosplan_name            = var.tfvars.ddosplan_name
}

### AKS ###

module "aks" {
  source = "./../resource_modules/aks"

  aks_cluster_name                         = var.tfvars.aks_cluster_name
  rg01_name                                = var.tfvars.rg01_name
  rg_location                              = var.tfvars.rg_location
  aks_version                              = var.tfvars.aks_version
  aks_default_nodepool_resource_group_name = var.tfvars.aks_default_nodepool_resource_group_name
  aks_private_cluster_enabled              = var.tfvars.aks_private_cluster_enabled
  aks_default_nodepool_name                = var.tfvars.aks_default_nodepool_name
  aks_default_nodepool_vm_size             = var.tfvars.aks_default_nodepool_vm_size
  subnet01                                 = module.vnet.subnet01_id
  aks_default_nodepool_type                = var.tfvars.aks_default_nodepool_type
  aks_default_nodepool_os_disk_size_gb     = var.tfvars.aks_default_nodepool_os_disk_size_gb
  aks_default_nodepool_enable_autoscaling  = var.tfvars.aks_default_nodepool_enable_autoscaling
  aks_default_nodepool_min_count           = var.tfvars.aks_default_nodepool_min_count
  aks_default_nodepool_max_count           = var.tfvars.aks_default_nodepool_max_count
  aks_default_nodepool_max_pods            = var.tfvars.aks_default_nodepool_max_pods
  aks_linux_username                       = var.tfvars.aks_linux_username
  aks_rbac_enabled                         = var.tfvars.aks_rbac_enabled
  tenant_id                                = var.tfvars.tenant_id
  aks_rbac_managed                         = var.tfvars.aks_rbac_managed
  aks_service_principal_id                 = var.tfvars.aks_service_principal_id
  aks_service_principal_secret             = var.tfvars.aks_service_principal_secret
  aks_network_plugin                       = var.tfvars.aks_network_plugin
  aks_network_profile_docker_bridge_cidr   = var.tfvars.aks_network_profile_docker_bridge_cidr
  aks_network_profile_service_cidr         = var.tfvars.aks_network_profile_service_cidr
  aks_network_profile_dns_service_ip       = var.tfvars.aks_network_profile_dns_service_ip
  aks_server_authorised_ip_ranges          = var.tfvars.aks_server_authorised_ip_ranges
  aks_ssh_key                              = var.aks_ssh_key
  aks_outbound_type                        = var.tfvars.aks_outbound_type  
  aks_load_balancer_sku                    = var.tfvars.aks_load_balancer_sku
  aks_admin_group_ids                      = var.tfvars.aks_admin_group_ids
  #aks_logana_enabled                      = var.tfvars.aks_logana_enabled
  #aks_logana_id                           = var.tfvars.aks_logana_id
  tags                                     = var.tfvars.tags

}

### ACR ###

module "acr" {
  source = "./../resource_modules/acr"

  acr_name                        = var.tfvars.acr_name
  rg01_name                       = var.tfvars.rg01_name
  rg_location                     = var.tfvars.rg_location
  acr_sku                         = var.tfvars.acr_sku
  acr_network_rule_action_default = var.tfvars.acr_network_rule_action_default
  acr_network_rule_ip_range       = var.tfvars.acr_network_rule_ip_range
  acr_network_rule_action         = var.tfvars.acr_network_rule_action
  subnet_id                       = module.vnet.subnet01_id
  tags                            = var.tfvars.tags
}

### KV ###

module "kv" {
  source = "./../resource_modules/kv"
  depends_on = [module.vnet]

  tenant_id                           = var.tfvars.tenant_id
  rg01_name                           = var.tfvars.rg01_name
  rg_location                         = var.tfvars.rg_location
  kvs_name                            = var.tfvars.kvs_name
  kvs_sku                             = var.tfvars.kvs_sku
  kvs_purge_protection_enabled        = var.tfvars.kvs_purge_protection_enabled
  kvs_enabled_for_disk_encryption     = var.tfvars.kvs_enabled_for_disk_encryption
  kvs_enabled_for_deployment          = var.tfvars.kvs_enabled_for_deployment
  kvs_enabled_for_template_deployment = var.tfvars.kvs_enabled_for_template_deployment
  kv_network_ip_rules                 = var.tfvars.kv_network_ip_rules
  kv_network_subnet_ids               = [module.vnet.subnet01_id, "/subscriptions/f8500a0b-5072-427b-82b8-edbf0f7f214d/resourceGroups/rg-weu-pr-core-pba/providers/Microsoft.Network/virtualNetworks/vnet-weu-pr-core-pba-01/Subnets/sn-pba"]
  kvs_group_id                        = var.tfvars.kvs_group_id
  tags                                = var.tfvars.tags
}

### Storage Account ###

module "storage" {
  source = "./../resource_modules/storage"
  depends_on = [module.vnet]

  storage_account_name             = var.tfvars.storage_account_name
  rg01_name                        = var.tfvars.rg01_name
  rg_location                      = var.tfvars.rg_location
  storage_account_tier             = var.tfvars.storage_account_tier
  storage_account_replication_type = var.tfvars.storage_account_replication_type
  storage_ip_rules                 = var.tfvars.storage_ip_rules
  storage_network_subnet_id        = [module.vnet.subnet01_id, "/subscriptions/f8500a0b-5072-427b-82b8-edbf0f7f214d/resourceGroups/rg-weu-pr-core-pba/providers/Microsoft.Network/virtualNetworks/vnet-weu-pr-core-pba-01/Subnets/sn-pba"]
  storage_tls_version              = var.tfvars.storage_tls_version
  storage_subnet_vnet_name         = var.tfvars.storage_subnet_vnet_name
  tags                             = var.tfvars.tags
}

### Cosmos DB ###

module "cosmos" {
  source = "./../resource_modules/db"

  cosmos_db_account_name       = var.tfvars.cosmos_db_account_name
  rg_location                  = var.tfvars.rg_location
  rg01_name                    = var.tfvars.rg01_name
  db_offer_type                = var.tfvars.db_offer_type
  db_kind                      = var.tfvars.db_kind
  db_enable_automatic_failover = var.tfvars.db_enable_automatic_failover
  db_consistency_level         = var.tfvars.db_consistency_level
  failover_location            = var.tfvars.failover_location
  subnet_id                    = module.vnet.subnet01_id
  db_ip_range_filter           = var.tfvars.db_ip_range_filter
  #cosmos_capabilities          = var.tfvars.cosmos_capabilities
  #cosmos_capabilities_db       = var.tfvars.cosmos_capabilities_db
  tags                         = var.tfvars.tags

}

### SignalR Service ###


module "signalr" {
  source = "./../resource_modules/signalr"

  signalr_name                  = var.tfvars.signalr_name
  rg_location                   = var.tfvars.rg_location
  signalr_sku                   = var.tfvars.signalr_sku
  rg01_name                     = var.tfvars.rg01_name
  signalr_pe_id                 = module.pe.private_endpoint_id
  signalr_allowed_request_types = var.tfvars.signalr_allowed_request_types
  tags                          = var.tfvars.tags

}

### Private Endpoint ###


module "pe" {
  source = "./../resource_modules/pe"

  rg_location                               = var.tfvars.rg_location
  pe_name                                   = var.tfvars.pe_name
  subnet02_id                               = module.vnet.subnet02_id
  subnet01_id                               = module.vnet.subnet01_id
  private_connection_resource_id_01         = module.signalr.signalr_id
  rg01_name                                 = var.tfvars.rg01_name
  dns_zone_name                             = var.tfvars.dns_zone_name
  private_dns_zone_id                       = [module.dns.dns_zone_id]
  private_connection_resource_id_01_kv      = module.kv.kvs_id
  #pe_kv_name                                = var.tfvars.pe_kv_name
  #dns_zone_name_kv                          = var.tfvars.dns_zone_name_kv
  #pe_storage_name                           = var.tfvars.pe_storage_name
  #private_connection_resource_id_01_storage = module.storage.storage_id
  #dns_zone_name_storage                     = var.tfvars.dns_zone_name_storage
  #pe_acr_name                               = var.tfvars.pe_acr_name
  #private_connection_resource_id_01_acr     = module.acr.acr_id
  #dns_zone_name_acr                         = var.tfvars.dns_zone_name_acr
  #pe_cosmos_name                            = var.tfvars.pe_cosmos_name
  #private_connection_resource_id_01_cosmos  = module.acr.acr_id
  #dns_zone_name_cosmos                      = var.tfvars.dns_zone_name_cosmos
  tags                                       = var.tfvars.tags
  
}

### DNS ###

module "dns" {
  source = "./../resource_modules/dns"
  
  dns_zone_name      = var.tfvars.dns_zone_name
  rg01_name          = var.tfvars.rg01_name
  dns_a_record_name  = var.tfvars.dns_a_record_name
  dns_record_value   = var.tfvars.dns_record_value
  dns_zone_vnet_link = module.vnet.vnet_id
  tags               = var.tfvars.tags
}