
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vault_address" {
  type    = string
  default = "127.0.0.1:8200"
}

variable "vault_role_id" {
  type    = string
  default = ""
}

variable "vault_secret_id" {
  type    = string
  default = ""
}