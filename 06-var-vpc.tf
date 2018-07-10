variable "name_vpc" {
	default = "AWS VPC"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}

variable "public_ip" {
	default = "10.0.10.0/24"
}

variable "private_ip" {
	default = "10.0.20.0/24"
}

variable "vpc_name" {
	default	= "vpc-terraform"
}

variable "environment" {
	default = "test"
}

variable "name_public_subnet" {
	default = "Public Subnet"
}

variable "name_private_subnet" {
	default = "Pivate Subnet"
}

variable "nat-gateway" {
	default = "Nat Gateway"
}

variable "name-pub-table" {
	default = "Public-Route-Table"
}

variable "name-priv-table" {
	default = "Private-Route-Table"
}

