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
data "azurerm_key_vault" "asomkv" {
  name                = "${var.resprefix}kv1"
  resource_group_name = data.azurerm_resource_group.asom.name

}
data "azurerm_key_vault_secret" "serviceprincipalsecret" {
  name         = "serviceprincipalsecret"
  key_vault_id = data.azurerm_key_vault.asomkv.id
}

resource "azurerm_storage_account" "asom-storage" {
  name                     = "${var.resprefix}storage"
  resource_group_name      = data.azurerm_resource_group.asom.name
  location                 = data.azurerm_resource_group.asom.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}




/*
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



