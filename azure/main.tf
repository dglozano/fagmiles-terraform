# Ref.: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# Login using az login

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "fagmiles_rg" {
  name     = "fagmiles"
  location = "West Europe"
}

locals {
  rg_location = azurerm_resource_group.fagmiles_rg.location
  rg_name     = azurerm_resource_group.fagmiles_rg.name
}
