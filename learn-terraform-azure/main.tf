# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "training-rg-schee805"
    storage_account_name = "storageaccountschee805"
    container_name       = "terraform-state-schee805"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"

  tags = {
    environment = "training"
    team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "training-vnet-schee805"
  address_space       = ["10.0.0.0/16"]
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountschee805"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage" {
  name                  = "terraform-state-schee805"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "blob"
}
