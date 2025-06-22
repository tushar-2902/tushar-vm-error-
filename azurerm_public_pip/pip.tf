resource "azurerm_public_ip" "example" {
  name                = var.pip-name
  resource_group_name = var.rg-name
  location            = var.location
  allocation_method   = "Static"

}