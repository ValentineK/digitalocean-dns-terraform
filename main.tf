resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

module "google" {
  source      = "./modules/google"
  domain_name = var.domain_name
  count       = var.google_enable ? 1 : 0

  depends_on  = [ digitalocean_domain.domain ]
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