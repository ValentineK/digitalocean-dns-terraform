resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

resource "digitalocean_record" "txt" {
  for_each = {for index, prop in var.txt_records:  sha1("${prop.name}/${prop.target}") => prop}
  domain   = digitalocean_domain.domain.name

  name     = each.value.name
  type     = "TXT"
  ttl      = 3600
  value    = each.value.target

  depends_on = [ digitalocean_domain.domain ]
}

resource "digitalocean_record" "a" {
  for_each = {for index, prop in var.a_records:  "${prop.name}/${prop.target}" => prop}
  domain   = digitalocean_domain.domain.name

  name     = each.value.name
  type     = "A"
  ttl      = 300
  value    = each.value.target

  depends_on = [ digitalocean_domain.domain ]
}

resource "digitalocean_record" "cname" {
  for_each   = {for index, prop in var.cname_records:  "${prop.name}/${prop.target}" => prop}
  domain     = digitalocean_domain.domain.name

  name       = each.value.name
  type       = "CNAME"
  ttl        = 300
  value      = each.value.target

  depends_on = [ digitalocean_record.a ]
}

resource "digitalocean_record" "mx" {
  for_each   = {for index, prop in var.mx_records:  "${prop.priority}/${prop.target}" => prop}
  domain   = digitalocean_domain.domain.name

  type     = "MX"
  name     = "@"
  priority = each.value.priority
  value    = each.value.target

  depends_on = [ digitalocean_domain.domain ]
}