variable "domain_name" {
  type = string
}

variable "mx_records" {
  type = map
  default = {
    "alt2.aspmx.l.google.com." = 20
    "aspmx5.googlemail.com."   = 30
    "alt1.aspmx.l.google.com." = 20
    "aspmx3.googlemail.com."   = 30
    "aspmx.l.google.com."      = 10
    "aspmx2.googlemail.com."   = 30
    "aspmx4.googlemail.com."   = 30
  }
}

variable "srv_records" {
  type = list(object({
    name     = string
    priority = number
    weight   = number
    port     = number
    target   = string
  }))
  default = [
    {
      name     = "_jabber._tcp"
      priority = 5
      weight   = 0
      port     = 5269
      target   = "xmpp-server.l.google.com."
    },
    {
      name     = "_jabber._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server4.l.google.com"
    },
    {
      name     = "_jabber._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server2.l.google.com"
    },
    {
      name     = "_jabber._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server1.l.google.com"
    },
    {
      name     = "_jabber._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server3.l.google.com"
    },
    {
      name     = "_xmpp-client._tcp"
      priority = 5
      weight   = 0
      port     = 5222
      target   = "talk.l.google.com"
    },
    {
      name     = "_xmpp-client._tcp"
      priority = 50
      weight   = 0
      port     = 5222
      target   = "talk4.l.google.com"
    },
    {
      name     = "_xmpp-client._tcp"
      priority = 5
      weight   = 0
      port     = 5222
      target   = "talk1.l.google.com"
    },
    {
      name     = "_xmpp-client._tcp"
      priority = 20
      weight   = 0
      port     = 5222
      target   = "talk3.l.google.com"
    },
    {
      name     = "_xmpp-client._tcp"
      priority = 20
      weight   = 0
      port     = 5222
      target   = "talk2.l.google.com"
    },
    {
      name     = "_xmpp-server._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server4.l.google.com"
    },
    {
      name     = "_xmpp-server._tcp"
      priority = 5
      weight   = 0
      port     = 5269
      target   = "xmpp-server.l.google.com"
    },
    {
      name     = "_xmpp-server._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server2.l.google.com"
    },
    {
      name     = "_xmpp-server._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server1.l.google.com"
    },
    {
      name     = "_xmpp-server._tcp"
      priority = 20
      weight   = 0
      port     = 5269
      target   = "xmpp-server3.l.google.com"
    }
  ]
}

variable "cname_records" {
  type = list(object({
    name     = string
    target   = string
  }))
  default = [
    {
      name   = "calendar"
      target = "ghs.google.com."
    },
    {
      name   = "docs"
      target = "ghs.google.com."
    },
    {
      name   = "mail"
      target = "ghs.google.com."
    },
    {
      name   = "sites"
      target = "ghs.google.com."
    },
    # {
    #   name   = "www"
    #   target = "ghs.google.com."
    # },
  ]
}
