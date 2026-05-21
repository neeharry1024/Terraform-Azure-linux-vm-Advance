terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstateneelam2026"
    container_name       = "tfstate"
    key                  = "prod-linux-vm.tfstate"
  }
}
