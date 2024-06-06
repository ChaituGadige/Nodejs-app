resource "azurerm_resource_group" "pearl" {
  name     = "Nodejs-rg"
  location = "East US"
}

resource "azurerm_service_plan" "app_srv_plan" {
  name                = "wbapp-srv-pln"
  location            = azurerm_resource_group.pearl.location
  resource_group_name = azurerm_resource_group.pearl.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsrv" {
  name                = "webapp7216"
  location            = azurerm_resource_group.pearl.location
  resource_group_name = azurerm_resource_group.pearl.name
  app_service_plan_id = azurerm_app_service_plan.app_srv_plan.id

  
  site_config {
    use_32_bit_worker_process = true
    linux_fx_version = "node|12-lts"
  }

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "12.13.0"
 }
}
