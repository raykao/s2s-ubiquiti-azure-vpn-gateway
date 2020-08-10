resource "azurerm_network_interface" "admin" {
  name                = "admin-nic"
  resource_group_name = azurerm_resource_group.admin.name
  location            = azurerm_resource_group.admin.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.admin.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "admin" {
  name                = "${local.prefix}-${terraform.workspace}-${var.location}-admin-machine"
  resource_group_name = azurerm_resource_group.admin.name
  location            = azurerm_resource_group.admin.location
  size                = "Standard_D4s_v3"
  admin_username      = "${local.prefix}adminuser"
  network_interface_ids = [
    azurerm_network_interface.admin.id,
  ]

  admin_ssh_key {
    username   = "${local.prefix}adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}