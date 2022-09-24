# Creating Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.pro-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt"
  }
}


# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.web-pub-sub-1.id
  route_table_id = aws_route_table.rt.id
}

# Associating Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.app-pub-sub-1.id
  route_table_id = aws_route_table.rt.id
}
