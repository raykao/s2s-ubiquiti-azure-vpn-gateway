resource "azurerm_resource_group" "core" {
  name = "rg-${local.prefix}-${terraform.workspace}-${local.location}-core"
  location = local.location
}

resource "azurerm_resource_group" "admin" {
  name = "rg-${local.prefix}-${terraform.workspace}-${local.location}-admin"
  location = local.location
}