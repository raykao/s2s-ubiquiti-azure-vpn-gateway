resource "azurerm_virtual_network" "core" {
  name = "vnet-${local.prefix}-core"
  location = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  address_space = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "vpn-gateway" {
  name = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.core.name
  resource_group_name = azurerm_resource_group.core.name

  address_prefixes       = ["172.16.1.0/24"]
}

resource "azurerm_subnet" "admin" {
  name = "AdminSubnet"
  virtual_network_name = azurerm_virtual_network.core.name
  resource_group_name = azurerm_resource_group.core.name

  address_prefixes       = ["172.16.2.0/24"]
}