# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

resource "azurerm_resource_group" "az400-t05-terraform" {
    name = "az400-m014-terraform"
    location = "westeurope"
}

resource "azurerm_app_service_plan" "az400-t05-terraform" {
    name                = "terraformPlan"
    location            = azurerm_resource_group.az400-t05-terraform.location
    resource_group_name = azurerm_resource_group.az400-t05-terraform.name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "az400-t05-terraform" {
    name                = "terraformApp1234"
    location            = azurerm_resource_group.az400-t05-terraform.location
    resource_group_name = azurerm_resource_group.az400-t05-terraform.name
    app_service_plan_id = azurerm_app_service_plan.az400-t05-terraform.id
}

resource "azurerm_app_service_slot" "az400-t05-terraform" {
    name                = "terraformApp1234SlotOne"
    location            = azurerm_resource_group.az400-t05-terraform.location
    resource_group_name = azurerm_resource_group.az400-t05-terraform.name
    app_service_plan_id = azurerm_app_service_plan.az400-t05-terraform.id
    app_service_name    = azurerm_app_service.az400-t05-terraform.name
}