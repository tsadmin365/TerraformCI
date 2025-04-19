terraform {
  required_version = "~> 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43"
    }
  }

  cloud {
    organization = "tzu‑cloud"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id            = "80ea84e8-afce-4851-928a-9e2219724c69"
  skip_provider_registration = true
}

data "azurerm_resource_group" "existing" {
  name = "1-e0c19e92-playground-sandbox"
}

resource "azurerm_storage_account" "tscloud16888" {
  name                     = "tscloud16888"
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}