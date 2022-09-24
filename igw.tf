# Creating Internet Gateway
resource "aws_internet_gateway" "igw" {
vpc_id = "${aws_vpc.pro-vpc.id}"
}