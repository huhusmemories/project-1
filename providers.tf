terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  # Use the following line to avoid error
  # "Terraform Azure Resource provider registration fails"
  skip_provider_registration = "true"
  features {

  }
}
