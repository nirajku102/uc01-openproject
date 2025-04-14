variable "region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "openproject-key.pem"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  description = "ami-00a929b66ed6e0de6"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
