
###########################################################
#subnets mySql
resource "aws_subnet" "us-east-1b-private" {
  vpc_id            = "${aws_vpc.wordpress_vpc.id}"
  cidr_block        = "172.16.5.0/24"
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "mySql_subnet_2",
    SubnetAccess = "Public",
    Env = "Test"
  }
}
resource "aws_subnet" "us-east-1c-private" {
  vpc_id            = "${aws_vpc.wordpress_vpc.id}"
  cidr_block        = "172.16.6.0/24"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "mySql_subnet_2",
    SubnetAccess = "Public",
    Env = "Test"
  }
}
###############################################################

# Routing table for private subnets

resource "aws_route_table" "us-east-1-private" {
	vpc_id = "${aws_vpc.wordpress_vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id  = "${aws_nat_gateway.nat_gw.id}"
	}
}

resource "aws_route_table_association" "us-east-1b-private" {
	subnet_id = "${aws_subnet.us-east-1b-private.id}"
	route_table_id = "${aws_route_table.us-east-1-private.id}"
}

resource "aws_route_table_association" "us-east-1c-private" {
	subnet_id = "${aws_subnet.us-east-1c-private.id}"
	route_table_id = "${aws_route_table.us-east-1-private.id}"
}
