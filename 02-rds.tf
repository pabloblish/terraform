# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE DATABASE TIER
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_db_instance" "default" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type         = "${var.storage_type}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.name}"
  username             = "${var.username}"
  password             = "${var.password}"
  port				   = "${var.port}"
  parameter_group_name = "default.mysql5.6"
  vpc_security_group_ids = ["${aws_security_group.database.id}"]
}