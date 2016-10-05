# Routing table for public subnets

resource "aws_route_table" "us-east-1-public" {
	vpc_id = "${aws_vpc.wordpress_vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.internetgw.id}"
	}
}

resource "aws_route_table_association" "us-east-1b-public" {
	subnet_id = "${aws_subnet.us-east-1b-public.id}"
	route_table_id = "${aws_route_table.us-east-1-public.id}"
}

resource "aws_route_table_association" "us-east-1c-public" {
	subnet_id = "${aws_subnet.us-east-1c-public.id}"
	route_table_id = "${aws_route_table.us-east-1-public.id}"
}

resource "aws_subnet" "us-east-1b-public" {
  vpc_id            = "${aws_vpc.wordpress_vpc.id}"
  cidr_block        = "172.16.1.0/24"
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "WordPress_App_subnet_1",
    SubnetAccess = "Public",
    Env = "Test"
  }
}
resource "aws_subnet" "us-east-1c-public" {
  vpc_id            = "${aws_vpc.wordpress_vpc.id}"
  cidr_block        = "172.16.2.0/24"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "WordPress_App_subnet_2",
    SubnetAccess = "Public",
    Env = "Test"
  }
}
