#Setting Subscription ID
provider "azurerm" {
  features {}
  tenant_id       = var.tenet_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}


data "azurerm_resource_group" "asom" {
  name = "${var.prefix}-rg"
}



resource "azurerm_storage_account" "asom-storage" {
  name                     = "${var.resprefix}storage"
  resource_group_name      = data.azurerm_resource_group.asom.name
  location                 = data.azurerm_resource_group.asom.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

resource "azurerm_key_vault" "asomkv" {
  name                        = "${var.resprefix}kv"
  location                    = data.azurerm_resource_group.asom.location
  resource_group_name         = data.azurerm_resource_group.asom.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenet_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenet_id
    object_id = var.client_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}



/*
resource "azurerm_function_app" "mocasomfunctionappdev" {
  name                       = "${var.resprefix}functionapp"
  location                   = "${data.azurerm_resource_group.asom.location}"
  resource_group_name        = "${data.azurerm_resource_group.asom.name}"
  app_service_plan_id        = azurerm_app_service_plan.asom.id
  storage_account_name       = azurerm_storage_account.asom-storage.name
  storage_account_access_key = azurerm_storage_account.asom-storage.primary_access_key
  
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node",
    CosmosDBAuthKey = "9uRWyXfXOuGXhPcuywKacLMctUuSG7QgE7AXO2cKrPtQRpc6lINBwZNdsvqkLVE6h26f6k9Uf5p6JVv30imBtA==",
    CosmosDBEndpoint ="https://mocasomtestcosmosdb.documents.azure.com:443/",
    DatabaseName = "mocasomcosmosdbdatabase",
    CollectionName = "mocasomcosmosdbcontainer",
  }
}

resource "azurerm_app_service_plan" "asom" {
  name                = "${var.prefix}-asp"
  location            = "${data.azurerm_resource_group.asom.location}"
  resource_group_name = "${data.azurerm_resource_group.asom.name}"
  #kind                = "Windows"
  #reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
*/

