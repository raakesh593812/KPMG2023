terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.2"
    }
  }
backend "remote" {
  hostname = "tfe.myorg.com"
  organization = "azurepoc-rakesh"
  workspaces {
    name = "azure-tf-cloud-poc"
  }
  
}

}

provider "azurerm" {
  features {}
}