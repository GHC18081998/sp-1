# Creating VPC
resource "aws_vpc" "pro-vpc" {
cidr_block = "192.168.0.0/16"
instance_tenancy = "default"
tags = {
Name = "pro-vpc"
}
}