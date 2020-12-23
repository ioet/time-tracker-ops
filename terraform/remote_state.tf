terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatestoacc"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}