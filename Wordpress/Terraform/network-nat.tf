# NAT instance

#resource "aws_security_group" "nat" {
#	name = "nat"
#	description = "Allow services from the private subnet through NAT"
#
#	ingress {
#		from_port = 0
#		to_port = 65535
#		protocol = "tcp"
#		cidr_blocks = ["${aws_subnet.us-east-1b-private.cidr_block}"]
#	}
#	ingress {
#		from_port = 0
#		to_port = 65535
#		protocol = "tcp"
#		cidr_blocks = ["${aws_subnet.us-east-1c-private.cidr_block}"]
#	}
#
#	vpc_id = "${aws_vpc.wordpress_vpc.id}"
#}

#resource "aws_instance" "nat" {
#	ami = "${var.aws_nat_ami}"
#	availability_zone = "us-east-1b"
#	instance_type = "t2.micro"
#	key_name = "${var.aws_key_name}"
#	security_groups = ["${aws_security_group.nat.id}"]
#	subnet_id = "${aws_subnet.us-east-1b-public.id}"
#	associate_public_ip_address = true
#	source_dest_check = false
#	tags {
		#Name = "nat",
#		Env = "Test"
#	}
#}


resource "aws_nat_gateway" "nat_gw" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.us-east-1b-public.id}"
}


resource "aws_eip" "nat" {
	vpc = true
}