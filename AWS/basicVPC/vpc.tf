resource "aws_vpc" "basic_vpc" {
    cidr_block = "${var.vpc_cidr}"
    
    tags {
        Name = "${var.prefix}_vpc",
        Env = "${var.environment}"
        CreatedBy = "Terraform_${var.terraform_tag_id}"
    }
}

resource "aws_internet_gateway" "basic_vpc_internetgw" {
    vpc_id = "${aws_vpc.basic_vpc.id}"
    tags {
        Name = "${var.prefix}_internetgw"
        Env = "${var.environment}"
        CreatedBy = "Terraform_${var.terraform_tag_id}"
    }
}

resource "aws_nat_gateway" "basic_vpc_nat_gw" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.basic_vpc_public_subnet1.id}"
}

resource "aws_eip" "nat" {
	vpc = true
}






