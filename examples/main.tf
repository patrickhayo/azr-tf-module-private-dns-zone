resource "azurerm_resource_group" "this" {
  name     = uuid()
  location = "westeurope"
}

data "azurerm_client_config" "this" {}

module "privatednszone" {
  source               = "./module"
  name                 = "example.mydomain.com"
  resource_group_name  = azurerm_resource_group.this.name
  registration_enabled = true
  virtual_networks_to_link = {
    ("myVnetNameToLink_1") = {
      subscription_id     = data.azurerm_client_config.this.subscription_id
      resource_group_name = "myVnetResourceGroupNameToLink_1"
    }
  }
  depends_on = [
    module.network,
  ]
}
