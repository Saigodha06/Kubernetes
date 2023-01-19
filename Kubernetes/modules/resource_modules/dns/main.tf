resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.rg01_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "test"
  resource_group_name   = var.rg01_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = var.dns_zone_vnet_link
}

output "dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}