#### Private ###########################################################

resource "aws_subnet" "basic_vpc_private_subnet1" {
    vpc_id = "${aws_vpc.basic_vpc.id}"
    cidr_block = "${var.private_subnets[0]}"
    availability_zone = "${var.aws_region}${var.availability_zones[0]}"
    tags {
        Name = "${var.prefix}_private_subnet1"
        Env = "${var.environment}"
        CreatedBy = "Terraform_${var.terraform_tag_id}"
    }
}
resource "aws_subnet" "basic_vpc_private_subnet2" {
    vpc_id = "${aws_vpc.basic_vpc.id}"
    cidr_block = "${var.private_subnets[1]}"
    availability_zone = "${var.aws_region}${var.availability_zones[1]}"
    tags {
        Name = "${var.prefix}_private_subnet2"
        Env = "${var.environment}"
        CreatedBy = "Terraform_${var.terraform_tag_id}"
    }
}

resource "aws_route_table" "basic_vpc_private_route_to_nat_gw" {
	vpc_id = "${aws_vpc.basic_vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id  = "${aws_nat_gateway.basic_vpc_nat_gw.id}"
	}
    tags {
        Name = "${var.prefix}_private_route_to_nat_gw"
        Env = "${var.environment}"
        CreatedBy = "Terraform_${var.terraform_tag_id}"
    }
}


resource "aws_route_table_association" "basic_vpc_private_subnet1_route_table_association" {
	subnet_id = "${aws_subnet.basic_vpc_private_subnet1.id}"
	route_table_id = "${aws_route_table.basic_vpc_private_route_to_nat_gw.id}"
}

resource "aws_route_table_association" "basic_vpc_private_subnet2_route_table_association" {
	subnet_id = "${aws_subnet.basic_vpc_private_subnet2.id}"
	route_table_id = "${aws_route_table.basic_vpc_private_route_to_nat_gw.id}"
}
