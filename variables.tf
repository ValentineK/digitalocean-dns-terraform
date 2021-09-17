variable "domain_name" {
  type = string
  default = "konov.su"
}

variable "google_enable" {
  type = bool
  default = true
}

variable "txt_records" {
  type = list(object({
    name     = string
    target   = string
  }))
  default = [
  ]
}

variable "a_records" {
  type = list(object({
    name     = string
    target   = string
  }))
  default = [
  ]
}

variable "cname_records" {
  type = list(object({
    name     = string
    target   = string
  }))
  default = [
  ]
}
