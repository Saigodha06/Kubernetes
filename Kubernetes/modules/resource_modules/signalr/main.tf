resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
  tags                = var.tags

  sku {
    name     = var.signalr_sku
    capacity = 1
  }
}

resource "azurerm_signalr_service_network_acl" "signalr_nacl" {
  signalr_service_id = azurerm_signalr_service.signalr.id
  default_action     = "Deny"

  public_network {
  }

  private_endpoint {
    id                    = var.signalr_pe_id
    allowed_request_types = var.signalr_allowed_request_types
  }
}

output "signalr_id" {
    value = azurerm_signalr_service.signalr.id
}