resource "azurerm_subnet" "example" {
  name                 = var.sb-name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vn-name
  address_prefixes     = var.ap-value
}

