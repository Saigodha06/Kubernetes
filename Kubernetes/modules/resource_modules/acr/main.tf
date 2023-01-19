resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rg01_name
  location            = var.rg_location
  sku                 = var.acr_sku
  tags                = var.tags

  network_rule_set {
    default_action = var.acr_network_rule_action_default

    ip_rule = [
      for ip in var.acr_network_rule_ip_range : {
        action   = var.acr_network_rule_action
        ip_range = ip
      }
    ]
    virtual_network {
      action    = var.acr_network_rule_action
      subnet_id = var.subnet_id
    }

     virtual_network {
      action    = var.acr_network_rule_action
      subnet_id = "/subscriptions/f8500a0b-5072-427b-82b8-edbf0f7f214d/resourceGroups/rg-weu-pr-core-pba/providers/Microsoft.Network/virtualNetworks/vnet-weu-pr-core-pba-01/Subnets/sn-pba"
    }

  }
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}