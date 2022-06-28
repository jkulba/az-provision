terraform {
  required_providers {
    azurerm = {
      version = "3.11.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "mando" {
  name     = "rg-beskar-dev"
  location = "westus"
  tags = {
    "env" = "develop"
  }

}
