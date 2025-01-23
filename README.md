<!-- BEGIN_TF_DOCS -->
## Usage
```hcl
module "my_firewall_addresses" {
  source = "https://github.com/canada-ca-terraform-modules/terraform-fortios-firewall-address"
  providers = {
    fortios = fortios.my_alias
  }

  my_addresses = {
    cloudflare_dns = {
      subnet = "1.1.1.1/32"
    },
    "mystorageaccount.blob.core.windows.net" = {
      fqdn = "mystorageaccount.blob.core.windows.net"
    },
    "awesome.website.com" = {
      fqdn      = "awesome.website.com"
      cache_ttl = 300 #Higher cache TTL for FQDNS with frequent DNS changes
    },
    "my-azure-reource-group" = {
      dynamic = {
        sdn           = "my_azure_sdn_connector_name" #Pre-defined SDN connector onthe fortigate, in this case, for Azure
        sdn_addr_type = "private"
        filter        = "ResourceGroup=my-azure-reource-group" #Filter for SDN connector. key=value format, e.g. loadbalancer=myloadbalancer
      }
    },
    powerbi_service_tag = {
      dynamic = {
        sdn           = "my_azure_sdn_connector_name"
        sdn_addr_type = "private"
        filter        = "ServiceTag=PowerBI" #Azure Service Tag based address object. 
      }
    }
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_fortios"></a> [fortios](#requirement\_fortios) | >= 1.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fortios"></a> [fortios](#provider\_fortios) | >= 1.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fortios_firewall_address.this](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/firewall_address) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addresses"></a> [addresses](#input\_addresses) | List of addresses | `map(object())` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_addresses"></a> [addresses](#output\_addresses) | n/a |
<!-- END_TF_DOCS -->