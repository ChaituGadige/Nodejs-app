resource "azurerm_resource_group" "pearl" {
  name     = "Nodejs-rg"
  location = "East US"
}

resource "azurerm_service_plan" "srv_pln" {
  name                = "sp"
  location            = azurerm_resource_group.pearl.location
  resource_group_name = azurerm_resource_group.pearl.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "wbapp" {
  name                = "webapp7216"
  location            = azurerm_resource_group.pearl.location
  resource_group_name = azurerm_resource_group.pearl.name
  service_plan_id     = azurerm_service_plan.srv_pln.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }
}
