
variable "given_name" {
  type    = string
  default = ""
}

variable "surname" {
  type    = string
  default = ""
}

variable "user_principal_name" {
  type    = string
  default = "test-user"
}

variable "mail_nickname" {
  type    = string
  default = ""
}

variable "password" {
  type    = string
  default = "SecretP@sswd99!"
}

variable "description" {
  type    = string
  default = ""
}

variable "createdBy" {
  type    = string
  default = "ops-team"
}
