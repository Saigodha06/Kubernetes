resource "azurerm_cosmosdb_account" "db_account" {
  name                = var.cosmos_db_account_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  offer_type          = var.db_offer_type
  kind                = var.db_kind
  tags                = var.tags

  enable_automatic_failover = var.db_enable_automatic_failover

  consistency_policy {
    consistency_level = var.db_consistency_level
  }

  capabilities {
    name = "EnableMongo"
  }

  capabilities {
    name = "DisableRateLimitingResponses"
  }

  geo_location {
    location          = "westeurope"
    failover_priority = 0
  }

  is_virtual_network_filter_enabled = true

  virtual_network_rule {
    id = var.subnet_id
  }

  virtual_network_rule {
    id = "/subscriptions/f8500a0b-5072-427b-82b8-edbf0f7f214d/resourceGroups/rg-weu-pr-core-pba/providers/Microsoft.Network/virtualNetworks/vnet-weu-pr-core-pba-01/Subnets/sn-pba"
  }

  ip_range_filter = join(",", var.db_ip_range_filter)


}