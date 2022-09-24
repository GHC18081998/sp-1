# Creating RDS Instance
resource "aws_db_subnet_group" "rds-db" {
  name       = "main"
  subnet_ids = [aws_subnet.db-pvt-sub-1.id, aws_subnet.db-pvt-sub-2.id]
  tags = {
    Name = "rds-db"
  }
}
resource "aws_db_instance" "db-instance" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.rds-db.id
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "t2.micro"
  multi_az               = true
  db_name                = "mydb"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}
