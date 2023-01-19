data "azurerm_subnet" "subnet01_id" {
  name = "sn-iep"
  virtual_network_name = var.storage_subnet_vnet_name
  resource_group_name = var.rg01_name
}

/*data "azurerm_subnet" "subnetpba" {
  name                 = "sn-pba"
  virtual_network_name = "vnet-weu-pr-core-pba-01"
  resource_group_name  = "rg-weu-pr-core-pba"
}

output "subnet_id_pba" {
  value = data.azurerm_subnet.subnetpba.id
}*/

resource "azurerm_storage_account" "storage01" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg01_name
  location                 = var.rg_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  min_tls_version          = var.storage_tls_version 
  tags                     = var.tags

   network_rules {
    default_action             = "Deny"
    ip_rules                   = var.storage_ip_rules
    virtual_network_subnet_ids = var.storage_network_subnet_id
  }
}

output "storage_id" {
  value = azurerm_storage_account.storage01.id
}