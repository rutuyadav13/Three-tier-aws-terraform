resource "aws_db_subnet_group" "db_subnet_group" {

  name = "three-tier-db-subnet-group"

  subnet_ids = [
    aws_subnet.app_private_1a.id,
    aws_subnet.app_private_1b.id,
    aws_subnet.app_private_1c.id
  ]

  tags = {
    Name = "three-tier-db-subnet-group"
  }

}
resource "aws_db_instance" "mysql_db" {

  identifier = "three-tier-mysql"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = "admin"
  password = "StrongPassword123"

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_sg.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "three-tier-mysql"
  }

}
