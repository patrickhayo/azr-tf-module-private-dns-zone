# azr-tf-module-private-dns-zone

[Terraform](https://www.terraform.io) Module to create **Private DNS Zone** in Azure

<!-- BEGIN_TF_DOCS -->
## Prerequisites

- [Terraform](https://releases.hashicorp.com/terraform/) v0.12+

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=2.36.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the resource group name of the private dns zone | `string` | n/a | yes |
| <a name="input_registration_enabled"></a> [registration\_enabled](#input\_registration\_enabled) | (Required) Specifies the resource group name of the private dns zone | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Specifies the tags of the private dns zone | `map` | `{}` | no |
| <a name="input_virtual_networks_to_link"></a> [virtual\_networks\_to\_link](#input\_virtual\_networks\_to\_link) | (Optional) Specifies the subscription id, resource group name, and name of the virtual networks to which create a virtual network link | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Specifies the resource id of the private dns zone. |
| <a name="output_name"></a> [name](#output\_name) | Specifies the resource id of the private dns zone. |

## Example

```hcl
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
```


<!-- END_TF_DOCS -->
## Authors

Originally created by [Patrick Hayo](http://github.com/patrickhayo)

## License

[MIT](LICENSE) License - Copyright (c) 2022 by the Author.
