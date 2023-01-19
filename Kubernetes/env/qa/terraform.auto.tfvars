tfvars = {

  tenant_id = "30cf3a87-45e5-437f-a5cb-eff8e766e152"

  tags = {
    "Environment"          = "QA"
    "Owner"                = "S7 IT Global Infrastructure"
    "Business Criticality" = "Low"
    "Project"              = "IEP"
    "Type"                 = "IAC"
  }


  ########## Resource Group ##########

  rg01_name   = "rg-weu-qa-iep"
  rg_location = "West Europe"


  ########## VNet & Subnet ##########

  vnet01_name              = "vnet-weu-qa-iep-01"
  vnet_address_space       = ["10.59.48.0/20"]

  ddosplan_name            = "vnet-weu-dev-iep-01-ddosplan01"

  subnet01_name            = "sn-iep"
  subnet01_address_prefix  = ["10.59.48.0/22"]
  subnet02_name            = "sn-iep-pe"
  subnet02_address_prefix  = ["10.59.56.0/28"]

  nsg01_name               = "nsg-weu-qa-iep-01"
  nsg02_name               = "nsg-weu-qa-iep-02"
  subnet_service_endpoints = ["Microsoft.ContainerRegistry", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB"]


  ########## AKS ##########

  aks_cluster_name                         = "aks-weu-qa-iep-001"
  aks_version                              = "1.22.11"
  aks_default_nodepool_resource_group_name = "rg-weu-qa-iepcompute-01"
  aks_private_cluster_enabled              = false

  #default node pool 
  aks_default_nodepool_name               = "agentpool"
  aks_default_nodepool_vm_size            = "Standard_D2_v2"
  aks_default_nodepool_type               = "VirtualMachineScaleSets"
  aks_default_nodepool_os_disk_size_gb    = 128
  aks_default_nodepool_enable_autoscaling = true
  aks_default_nodepool_min_count          = 3
  aks_default_nodepool_max_count          = 3
  aks_default_nodepool_max_pods           = 50

  #network
  aks_network_plugin                     = "azure"
  aks_network_profile_docker_bridge_cidr = "172.17.0.1/16"
  aks_network_profile_service_cidr       = "10.59.52.0/22"
  aks_network_profile_dns_service_ip     = "10.59.52.10"

  #rbac
  aks_rbac_enabled    = true
  aks_rbac_managed    = true
  aks_admin_group_ids = ["a09c0440-7ddc-4adc-80b5-cc9ecbbe0d3d", "de9fe465-6f74-4e8c-a3f8-a20a8e144a27", "0aa20080-bcf6-4b53-8712-0230ca84b674"]

  #log analytics
  #aks_logana_enabled = true
  #aks_logana_id      = "/subscriptions/ef399e05-8655-401d-97a1-a1377b740174/resourcegroups/defaultresourcegroup-weu/providers/microsoft.operationalinsights/workspaces/DefaultWorkspace-ef399e05-8655-401d-97a1-a1377b740174-WEU"


  #service principal
  aks_service_principal_id          = "c9cfa3d4-2bcd-40b9-a6a9-e8767e6ff1f5"
  aks_service_principal_secret      = "Mto7Q~.cmbukQ_SIQy5nowfRFuOgPE3Jmturx"
  

  #other
  aks_linux_username              = "linuxuser"
  aks_server_authorised_ip_ranges = ["185.46.212.0/23","165.225.80.0/22","165.52.102.0/24","165.225.16.0/23","165.225.76.0/23","185.46.214.0/23","165.255.196.0/23","165.225.198.0/23","40.114.161.138/32","180.150.92.169/32","94.195.237.65/32"]
  aks_outbound_type               = "userDefinedRouting"
  aks_load_balancer_sku           = "Standard"


  ########## ACR ##########

  acr_name                        = "acrweuqaiep001"
  acr_sku                         = "Premium"
  acr_network_rule_action_default = "Deny"
  acr_network_rule_ip_range       = ["185.46.212.0/23","165.225.80.0/22","165.52.102.0/24","165.225.16.0/23","165.225.76.0/23","185.46.214.0/23","165.255.196.0/23","165.225.198.0/23","40.114.161.138/32", "180.150.92.169/32"]
  acr_network_rule_action         = "Allow"


  ########## KV ##########

  kvs_name                            = "kv-weu-qa-core-iep"
  kvs_sku                             = "standard"
  kvs_group_id                        = ["a09c0440-7ddc-4adc-80b5-cc9ecbbe0d3d","de9fe465-6f74-4e8c-a3f8-a20a8e144a27",/*"e1faeb66-fc97-4369-828c-415af1e24358"*/]
  kvs_purge_protection_enabled        = true
  kvs_enabled_for_disk_encryption     = false
  kvs_enabled_for_deployment          = true
  kvs_enabled_for_template_deployment = true
  kv_network_ip_rules                 = [/*"185.46.212.0/23","165.225.80.0/22","165.52.102.0/24","165.225.16.0/23","165.225.76.0/23","185.46.214.0/23","165.255.196.0/23","165.225.198.0/23","180.150.92.169/32",*/"147.161.184.0/23", "5.70.28.198/32"]


  ########## Storage Account ##########

  storage_account_name             = "storageweuqaiep01"
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  storage_ip_rules                 = ["185.46.212.0/23","165.225.80.0/22","165.52.102.0/24","165.225.16.0/23","165.225.76.0/23","185.46.214.0/23","165.255.196.0/23","165.225.198.0/23"]
  storage_tls_version              = "TLS1_2"
  storage_subnet_vnet_name         = "vnet-weu-qa-iep-01"



  ########## Cosmos DB ##########

  cosmos_db_account_name       = "db-weu-qa-iep-001"
  db_offer_type                = "Standard"
  db_kind                      = "MongoDB"
  db_enable_automatic_failover = false
  db_consistency_level         = "Session"
  failover_location            = "UK South"
  db_ip_range_filter           = ["185.46.212.0/23","165.225.80.0/22","165.52.102.0/24","165.225.16.0/23","165.225.76.0/23","185.46.214.0/23","165.255.196.0/23","165.225.198.0/23","104.42.195.92","40.76.54.131","52.176.6.30","52.169.50.45","52.187.184.26","147.161.184.0/23"]
  cosmos_capabilities          = "DisableRateLimitingResponses"


  ########## SignalR ##########

  signalr_name                  = "sigr-weu-qa-iep01"
  signalr_sku                   = "Standard_S1"
  signalr_allowed_request_types = ["ServerConnection","ClientConnection","RESTAPI","Trace"]


  ########## Private Endpoint ##########

  pe_name          = "pe-sigr-weu-qa-01"

  #pe_kv_name       = "pe-kv-weu-qa-01"
  #dns_zone_name_kv = "privatelink.vaultcore.azure.net"

  #pe_storage_name       = "pe-storage-weu-qa-01"
  #dns_zone_name_storage = "privatelink.blob.core.windows.net"

  #pe_acr_name       = "pe-acr-weu-qa-01"
  #dns_zone_name_acr = ""


  ########## DNS Zone ##########

  dns_zone_name     = "privatelink.service.signalr.net"    
  dns_a_record_name = "iep-sigr-qa-01"
  dns_record_value  = ["10.59.40.4"]

}