data "azurerm_public_ip" "data-ip" {
  name                = var.pip-name
  resource_group_name = var.rg-name
}

data "azurerm_subnet" "data-sb" {
  name                 = var.sb-name
  virtual_network_name = var.vn-name
  resource_group_name  = var.rg-name
}

data "azurerm_key_vault" "kv" {
  name                = "tushar-kv"
  resource_group_name = "tushar-rg"
}

data "azurerm_key_vault_secret" "example1" {
  name         = "adminname1"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "example2" {
  name         = "adminpassword2"
  key_vault_id = data.azurerm_key_vault.kv.id
}
