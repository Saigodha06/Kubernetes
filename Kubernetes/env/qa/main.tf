provider "azurerm" {
  version = "~> 2.78.0"
  features {}
  subscription_id            = "0f088400-c9d0-4213-a32c-0b7b4ddccaa6"
  tenant_id                  = "30cf3a87-45e5-437f-a5cb-eff8e766e152"
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {}
}



module "core_module" {
  source = "../../modules/core_module"

  tfvars      = var.tfvars
  aks_ssh_key = var.aks_ssh_key
}

