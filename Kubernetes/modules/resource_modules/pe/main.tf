resource "azurerm_private_endpoint" "pe" {
  name                = var.pe_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  subnet_id           = var.subnet02_id
  tags                = var.tags

  private_service_connection {
    name                           = "dev-signalr-connection"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id_01
    subresource_names              = ["signalr"]
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name
    private_dns_zone_ids = var.private_dns_zone_id
  }
}

output "private_endpoint_id" {
  value = azurerm_private_endpoint.pe.id
}

/*resource "azurerm_private_endpoint" "pekv" {
  name                = var.pe_kv_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  subnet_id           = var.subnet01_id
  tags                = var.tags

  private_service_connection {
    name                           = "kv-pe-connection"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id_01_kv
    subresource_names              = ["vault"]
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name_kv
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dnszone.id]
  }
}

resource "azurerm_private_endpoint" "pestorage" {
  name                = var.pe_storage_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  subnet_id           = var.subnet01_id

  private_service_connection {
    name                           = "storage-pe-connection"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id_01_storage
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name_storage
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dnszonestorage.id]
  }
}*/
/*
resource "azurerm_private_endpoint" "peacr" {
  name                = var.pe_acr_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  subnet_id           = var.subnet01_id

  private_service_connection {
    name                           = "acr-pe-connection"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id_01_acr
    subresource_names              = ["registry"]
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name_acr
    #private_dns_zone_ids = [data.azurerm_private_dns_zone.dnszonestorage.id]
  }
}

resource "azurerm_private_endpoint" "pecosmos" {
  name                = var.pe_cosmos_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  subnet_id           = var.subnet01_id

  private_service_connection {
    name                           = "acr-cosmos-connection"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id_01_cosmos
    subresource_names              = [""]
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name_cosmos
    #private_dns_zone_ids = [data.azurerm_private_dns_zone.dnszonestorage.id]
  }
}*/