# Creating 1st web subnet
resource "aws_subnet" "web-pub-sub-1" {
vpc_id = "${aws_vpc.pro-vpc.id}"
cidr_block = "192.168.100.0/24"
map_public_ip_on_launch = true
availability_zone = "us-east-2a"
tags = {
Name = "web-pub-sub-1"
}
}
# Creating 2nd web subnet
resource "aws_subnet" "web-pvt-sub-2" {
vpc_id = "${aws_vpc.pro-vpc.id}"
cidr_block = "192.168.200.0/24"
map_public_ip_on_launch = true
availability_zone = "us-east-2b"
tags = {
Name = "web-pub-sub-2"
}
}
# Creating 1st application subnet
resource "aws_subnet" "app-pub-sub-1" {
vpc_id = "${aws_vpc.pro-vpc.id}"
cidr_block = "192.168.220.0/24"
map_public_ip_on_launch = false
availability_zone = "us-east-2a"
tags = {
Name = "app-Sub-1"
}
}
# Creating 2nd application subnet
resource "aws_subnet" "app-pvt-sub-2" {
vpc_id = "${aws_vpc.pro-vpc.id}"
cidr_block = "192.168.240.0/24"
map_public_ip_on_launch = false
availability_zone = "us-east-2b"
tags = {
Name = "app-Sub-2"
}
}
