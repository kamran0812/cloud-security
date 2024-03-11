variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-0b0ea68c435eb488d"
}

variable "key_name" {
  type    = string
  default = "default_key"
}
