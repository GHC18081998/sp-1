# Create Database Security Group
resource "aws_security_group" "db-sg" {
name = "db-sg"
description = "Allow inbound traffic from application layer"
vpc_id = aws_vpc.pro-vpc.id
ingress {
description = "Allow traffic from application layer"
from_port = 3306
to_port = 3306
protocol = "tcp"
security_groups = [aws_security_group.web-sg.id]
}
egress {
from_port = 32768  #reserved for FileNet
to_port = 65535  #tcp for user applications
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "db-sg"
}
}