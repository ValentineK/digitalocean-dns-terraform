variable "domain_name" {
  type = string
  default = "konov.su"
}

variable "apple_enable" {
  type = bool
  default = false
}

variable "google_enable" {
  type = bool
  default = false
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

variable "mx_records" {
  type = list(object({
    priority = string
    target   = string
  }))
  default = [
  ]
}