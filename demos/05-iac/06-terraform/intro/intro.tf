# Configure the Azure provider
# might need: terraform init -upgrade

terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">= 2.26"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "az400-m14-terraform" {
    name = "az400-m014-terraform"
    location = "westeurope"
}

resource "azurerm_app_service_plan" "az400-m14-terraform" {
    name                = "terraformPlan"
    location            = azurerm_resource_group.az400-m14-terraform.location
    resource_group_name = azurerm_resource_group.az400-m14-terraform.name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "az400-m14-terraform" {
    name                = "terraformApp1234"
    location            = azurerm_resource_group.az400-m14-terraform.location
    resource_group_name = azurerm_resource_group.az400-m14-terraform.name
    app_service_plan_id = azurerm_app_service_plan.az400-m14-terraform.id
}

resource "azurerm_app_service_slot" "az400-m14-terraform" {
    name                = "terraformApp1234SlotOne"
    location            = azurerm_resource_group.az400-m14-terraform.location
    resource_group_name = azurerm_resource_group.az400-m14-terraform.name
    app_service_plan_id = azurerm_app_service_plan.az400-m14-terraform.id
    app_service_name    = azurerm_app_service.az400-m14-terraform.name
}