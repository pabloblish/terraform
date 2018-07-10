# ---------------------------------------------------------------
# ENVIRONMENT VARIABLES
# ---------------------------------------------------------------

variable "allocated_storage" {
	default = 10
}

variable "storage_type" {
	default = "gp2"
}

variable "engine" { 
	default = "mysql"
}

variable "engine_version" {
	default = "5.6.39"
}

variable "instance_class" {
	default = "db.t2.micro"
}

variable "name" {
	default = "mydb"
}

variable "username" {
	default = "admin"
}

variable "password" {
	default = "t3mp0ral"
}

variable "port" {
	default = 3306
}

# ---------------------------------------------------------------

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 80
}
variable "vpc_id" {
	default = "vpc-3eff8559"
}

variable "image_id" {
  default = "ami-25110f45"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "MyKeyPair"
}
