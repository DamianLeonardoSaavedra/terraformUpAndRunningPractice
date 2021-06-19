variable "region" {
  default = "us-east-1"
}

variable "azs" {
  default = "us-east-1a"
}

# vpc
variable "enve-dami-vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "enve-dami-sn-a-cidr" {
  default = "10.0.1.0/24"
}

variable "enve-dami-private-sn-a-cidr" {
  default = "10.0.64.0/24"
}

variable "ssh-port" {
  description = "allow SSH connections"
  default = 22
}

variable "http-port" {
  description = "allow HTTP requests"
  default = 80
}

variable "env" {
  default = "dev"
}

variable "key-name" {
  default = "test-ec2-dls"
  description = "server key name"
}

variable "key" {
  default = "test-ec2-dls.pem"
  description = "server key"
}
