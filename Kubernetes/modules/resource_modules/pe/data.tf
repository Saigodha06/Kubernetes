provider "azurerm" {
  features {}
  alias                      = "dnszone"
  subscription_id            = "f8500a0b-5072-427b-82b8-edbf0f7f214d"
  tenant_id                  = "30cf3a87-45e5-437f-a5cb-eff8e766e152"
  skip_provider_registration = true
}

data "azurerm_private_dns_zone" "dnszone" {
  provider            = azurerm.dnszone 
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = "rg-weu-pr-core"
}

data "azurerm_private_dns_zone" "dnszonestorage" {
  provider            = azurerm.dnszone 
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "rg-weu-pr-core"
}