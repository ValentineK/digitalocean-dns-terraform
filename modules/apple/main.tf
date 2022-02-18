resource "digitalocean_record" "mx" {
  for_each = var.mx_records
  domain   = var.domain_name

  type     = "MX"
  name     = "@"
  priority = each.value
  value    = each.key
}

resource "digitalocean_record" "cname" {
  for_each = {for index, prop in var.cname_records:  "${prop.name}/${prop.target}" => prop}
  domain   = var.domain_name

  name     = each.value.name
  type     = "CNAME"
  value    = each.value.target
}
