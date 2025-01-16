variable "addresses" {
  description = "List of addresses"

  type = map(object({
    fqdn      = optional(string)
    cache_ttl = optional(number, 0)

    dynamic = optional(object({
      sdn           = optional(string)
      sdn_addr_type = optional(string)
      filter        = optional(string)
    }))

    subnet = optional(string)
  }))
}
