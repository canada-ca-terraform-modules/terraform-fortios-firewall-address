resource "fortios_firewall_address" "this" {
  for_each = var.addresses

  name = each.key

  type = each.value.fqdn != null ? "fqdn" : (each.value.dynamic != null ? "dynamic" : (each.value.subnet != null ? "ipmask" : null))

  # fqdn
  fqdn      = each.value.fqdn != null ? each.value.fqdn : null
  cache_ttl = each.value.fqdn != null ? each.value.cache_ttl : null

  # dynamic
  sdn           = each.value.dynamic != null ? each.value.dynamic.sdn : null
  sdn_addr_type = each.value.dynamic != null ? each.value.dynamic.sdn_addr_type : null
  filter        = each.value.dynamic != null ? each.value.dynamic.filter : null

  # subnet
  subnet = each.value.subnet != null ? each.value.subnet : null
}
