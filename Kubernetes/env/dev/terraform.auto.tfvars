tfvars = {

  tenant_id = "30cf3a87-45e5-437f-a5cb-eff8e766e152"

  tags = {
    "Environment"          = "Development"
    "Owner"                = "S7 IT Global Infrastructure"
    "Business Criticality" = "Low"
    "Project"              = "IEP"
    "Type"                 = "IAC"
  }

  ########## Resource Group ##########

  rg01_name   = "rg-weu-dev-iep"
  rg_location = "West Europe"


  ########## VNet & Subnet ##########

  vnet01_name              = "vnet-weu-dev-iep-01"
  vnet_address_space       = ["10.59.32.0/20"]

  ddosplan_name            = "vnet-weu-dev-iep-01-ddosplan01"

  subnet01_name            = "sn-iep"
  subnet01_address_prefix  = ["10.59.32.0/22"]
  subnet02_name            = "sn-iep-pe"
  subnet02_address_prefix  = ["10.59.40.0/28"]

  nsg01_name               = "nsg-weu-dev-iep-01"
  nsg02_name               = "nsg-weu-dev-iep-02"
  subnet_service_endpoints = ["Microsoft.ContainerRegistry", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB"]


  ########## AKS ##########

  aks_cluster_name                         = "aks-weu-dev-iep-01"
  aks_version                              = "1.22.11"
  aks_default_nodepool_resource_group_name = "rg-weu-dev-iepcompute-01"
  aks_private_cluster_enabled              = false

  #default node pool 
  aks_default_nodepool_name               = "agentpool"
  aks_default_nodepool_vm_size            = "Standard_D2_v2"
  aks_default_nodepool_type               = "VirtualMachineScaleSets"
  aks_default_nodepool_os_disk_size_gb    = 128
  aks_default_nodepool_enable_autoscaling = true
  aks_default_nodepool_min_count          = 1
  aks_default_nodepool_max_count          = 2
  aks_default_nodepool_max_pods           = 40

  #network
  aks_network_plugin                     = "azure"
  aks_network_profile_docker_bridge_cidr = "172.17.0.1/16"
  aks_network_profile_service_cidr       = "10.59.36.0/22"
  aks_network_profile_dns_service_ip     = "10.59.36.10"

  #rbac
  aks_rbac_enabled = true
  aks_rbac_managed = true
  aks_admin_group_ids = ["a09c0440-7ddc-4adc-80b5-cc9ecbbe0d3d", "de9fe465-6f74-4e8c-a3f8-a20a8e144a27", "0aa20080-bcf6-4b53-8712-0230ca84b674", "10754831-42f0-40d1-bfad-2917df650fbf", "82c78a02-fda7-4b2b-a622-bc5299c338ad"]


  #log analytics
  #aks_logana_enabled = true
  #aks_logana_id      = "/subscriptions/ef399e05-8655-401d-97a1-a1377b740174/resourcegroups/defaultresourcegroup-weu/providers/microsoft.operationalinsights/workspaces/DefaultWorkspace-ef399e05-8655-401d-97a1-a1377b740174-WEU"


  #service principal
  aks_service_principal_id          = "5f5c3d56-2676-4afe-aece-9660432b88fe"
  aks_service_principal_secret      = "7e-lt_q83A-3xbnN5-k1.WLzXqDH..5W4W"


  #other
  aks_linux_username              = "linuxuser"
  aks_server_authorised_ip_ranges = ["180.150.92.169/32","94.5.9.113/32","90.202.123.248/32","147.12.136.24/32","40.114.161.138/32"]
  aks_outbound_type               = "userDefinedRouting"
  aks_load_balancer_sku           = "Standard"


  ########## ACR ##########

  acr_name                        = "acrweudeviep001"
  acr_sku                         = "Premium"
  acr_network_rule_action_default = "Deny"
  acr_network_rule_ip_range       = ["180.150.92.169", "51.241.127.38/32"]
  acr_network_rule_action         = "Allow"


  ########## KV ##########

  kvs_name                            = "kv-weu-dev-core-iep"
  kvs_sku                             = "standard"
  kvs_group_id                        = ["82c78a02-fda7-4b2b-a622-bc5299c338ad","a82d4de7-488e-4041-ac7c-a4c8026d8484"]
  kvs_purge_protection_enabled        = true
  kvs_enabled_for_disk_encryption     = false
  kvs_enabled_for_deployment          = true
  kvs_enabled_for_template_deployment = true
  kv_network_ip_rules                 = ["147.161.184.0/23", "5.70.28.198/32"]


  ########## Storage Account ##########

  storage_account_name             = "storageweudeviep01"
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  storage_ip_rules                 = ["180.150.92.169", "51.241.127.38"]
  storage_tls_version              = "TLS1_2"
  storage_subnet_vnet_name         = "vnet-weu-dev-iep-01"



  ########## Cosmos DB ##########

  cosmos_db_account_name       = "db-weu-dev-iep-001"
  db_offer_type                = "Standard"
  db_kind                      = "MongoDB"
  db_enable_automatic_failover = false
  db_consistency_level         = "Session"
  failover_location            = "UK South"
  db_ip_range_filter           = ["180.150.92.169","104.42.195.92","40.76.54.131","52.176.6.30","52.169.50.45","52.187.184.26"]
  #cosmos_capabilities          = "EnableMongo"/*, "DisableRateLimitingResponses"*/
  #cosmos_capabilities_db       = null



  ########## SignalR ##########

  signalr_name                  = "sigr-weu-dev-iep01"
  signalr_sku                   = "Standard_S1"
  signalr_allowed_request_types = ["ServerConnection","ClientConnection","RESTAPI","Trace"]


  ########## Private Endpoint ##########

  pe_name          = "pe-sigr-weu-dev-01"

  #pe_kv_name       = "pe-kv-weu-dev-01"
  #dns_zone_name_kv = "privatelink.vaultcore.azure.net" 

  #pe_storage_name       = "pe-storage-weu-dev-01"
  #dns_zone_name_storage = "privatelink.blob.core.windows.net"

  #pe_acr_name       = "pe-acr-weu-dev-01"
  #dns_zone_name_acr = "privatelink.azurecr.io"




  ########## DNS Zone ##########

  dns_zone_name     = "privatelink.service.signalr.net"    
  dns_a_record_name = "iep-sigr-dev-01"
  dns_record_value  = ["10.59.40.4"]

}