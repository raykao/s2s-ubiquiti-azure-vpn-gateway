resource "azurerm_resource_group" "core" {
  name = "rg-${local.prefix}-${terraform.workspace}-${local.location}-core"
  location = local.location
}