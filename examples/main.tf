resource "azurerm_resource_group" "this" {
  name     = uuid()
  location = "westeurope"
}

module "privatednszone" {
  source               = "./module"
  name                 = "myexample.mydomain.com"
  resource_group_name  = azurerm_resource_group.this.name
  registration_enabled = true
  virtual_networks_to_link = {
    ("myVneToLinkName_1") = {
      subscription_id     = "myVnetToLinkSsubscriptionId_1"
      resource_group_name = "myVnetToLinkResourceGroupName_1"
    },
    ("myVnetToLinkName_2") = {
      subscription_id     = "myVnetToLinkSsubscriptionId_2"
      resource_group_name = "myVnetToLinkResourceGroupName_2"
    }
  }
}
