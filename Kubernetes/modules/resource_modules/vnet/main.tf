### Compute VNet ###

resource "azurerm_virtual_network" "vnet01" {
  resource_group_name = var.rg01_name
  location            = var.rg_location
  name                = var.vnet01_name
  address_space       = var.vnet01_address_space

  ddos_protection_plan {
    id                = azurerm_network_ddos_protection_plan.ddosplan01.id
    enable            = true
  }
}

### Vnet DDOS Protection plan###

resource "azurerm_network_ddos_protection_plan" "ddosplan01" {
  name                = var.ddosplan_name
  location            = var.rg_location
  resource_group_name = var.rg01_name
}

### Subnets for Compute Vnet ###

resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet01_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.rg01_name
  address_prefixes     = var.subnet01_address_prefix
  service_endpoints    = var.subnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.subnet02_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.rg01_name
  address_prefixes     = var.subnet02_address_prefix
  enforce_private_link_endpoint_network_policies = true
}

### NSG for Subnets ###

resource "azurerm_network_security_group" "nsg01" {
  name                = var.nsg01_name
  resource_group_name = var.rg01_name
  location            = var.rg_location
  tags                = var.tags
}

resource "azurerm_network_security_group" "nsg02" {
  name                = var.nsg02_name
  resource_group_name = var.rg01_name
  location            = var.rg_location
  tags                = var.tags
}

### Linking NSG's to Subnets ###

resource "azurerm_subnet_network_security_group_association" "nsg_link01" {
  subnet_id                 = azurerm_subnet.subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_link02" {
  subnet_id                 = azurerm_subnet.subnet02.id
  network_security_group_id = azurerm_network_security_group.nsg02.id
}

### Route Table ###

/*resource "azurerm_route_table" "route_table" {
  name                          = "rt-weu-dev-iep-01"
  location                      = var.rg_location
  resource_group_name           = var.rg01_name
  disable_bgp_route_propagation = false

  route {
    name           = "aks-route"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
  }
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = azurerm_subnet.subnet01.id
  route_table_id = azurerm_route_table.route_table.id
}*/


### Output ###

output "subnet01_id" {
  value = azurerm_subnet.subnet01.id
}

output "subnet02_id" {
  value = azurerm_subnet.subnet02.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet01.id
}