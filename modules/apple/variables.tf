variable "domain_name" {
  type = string
}

variable "mx_records" {
  type = map
  default = {
    "mx01.mail.icloud.com." = 10
    "mx02.mail.icloud.com." = 10
  }
}

variable "cname_records" {
  type = list(object({
    name     = string
    target   = string
  }))
  default = [
    {
      name   = "sig1._domainkey"
      target = "sig1.dkim.konov.eu.at.icloudmailadmin.com."
    }
  ]
}
