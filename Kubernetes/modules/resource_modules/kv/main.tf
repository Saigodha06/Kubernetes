data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kvs" {

  name                = var.kvs_name
  sku_name            = var.kvs_sku
  location            = var.rg_location
  resource_group_name = var.rg01_name
  tenant_id           = var.tenant_id
  tags                = var.tags

  network_acls {
      default_action             = "Deny"
      bypass                     = "AzureServices"
      ip_rules                   = var.kv_network_ip_rules
      virtual_network_subnet_ids = var.kv_network_subnet_ids
  }


  purge_protection_enabled        = var.kvs_purge_protection_enabled
  enabled_for_disk_encryption     = var.kvs_enabled_for_disk_encryption
  enabled_for_deployment          = var.kvs_enabled_for_deployment
  enabled_for_template_deployment = var.kvs_enabled_for_template_deployment
}

resource "azurerm_key_vault_access_policy" "readers_policy" {
  for_each = toset(var.kvs_group_id)

  object_id    = each.value
  tenant_id    = var.tenant_id
  key_vault_id = azurerm_key_vault.kvs.id

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
    "decrypt",
    "encrypt",
    "unwrapKey",
    "wrapKey",
    "verify",
    "sign"
  ]

  secret_permissions = [
    "get",
    "set",
    "list",
    "delete",
    "recover",
    "backup",
    "restore"
  ]

  storage_permissions = [
    "get",
    "set",
    "list",
    "delete",
    "recover",
    "backup",
    "restore"
  ]

  certificate_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
    "Purge"
  
  ]
}

output "kvs_id" {
  value = azurerm_key_vault.kvs.id
}