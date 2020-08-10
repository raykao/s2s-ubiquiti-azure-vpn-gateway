resource "azurerm_local_network_gateway" "home" {
  name                = "backHome"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  gateway_address     = var.onprem-pip
  address_space       = [var.onprem-address-space]
}

resource "azurerm_public_ip" "core" {
  name                = "test"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "core" {
  name                = "test"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.core.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vpn-gateway.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                = "onpremise"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.core.id
  local_network_gateway_id   = azurerm_local_network_gateway.home.id

  shared_key = local.pre-shared-key
}