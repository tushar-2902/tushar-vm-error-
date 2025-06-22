resource "azurerm_key_vault" "kvex" {
  name                        = var.kv-name
  location                    = var.location
  resource_group_name         = var.rg-name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
      
    ]

  }
}

resource "azurerm_key_vault_secret" "adminname1" {
  name         = "adminname1"
  value        = "Tusharadmin"
  key_vault_id = azurerm_key_vault.kvex.id
}

resource "azurerm_key_vault_secret" "adminpassword2" {
  name         = "adminpassword2"
  value        = "Tusharadmin@123"
  key_vault_id = azurerm_key_vault.kvex.id
}




