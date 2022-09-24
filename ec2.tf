# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "web-1" {
  ami                         = "ami-026b57f3c383c2eec"
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  subnet_id                   = aws_subnet.web-pub-sub-1.id
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  tags = {
    Name = "web-1"
  }
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "web-2" {
  ami                         = "ami-026b57f3c383c2eec"
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  subnet_id                   = aws_subnet.app-pub-sub-1.id
  associate_public_ip_address = true
  user_data                   = file("userdata1.sh")
  tags = {
    Name = "web-2"
  }
}
# Creating 3rd EC2 instance in Private Subnet
resource "aws_instance" "db" {
  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = "t3.micro"
  key_name               = "terraform"
  vpc_security_group_ids = ["${aws_security_group.db-sg.id}"]
  subnet_id              = aws_subnet.db-pvt-sub-1.id
  tags = {
    Name = "db"
  }
}
