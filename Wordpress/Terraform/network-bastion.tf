# Bastion

resource "aws_security_group" "bastion" {
	name = "bastion"
	description = "Allow SSH traffic from the internet"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	vpc_id = "${aws_vpc.wordpress_vpc.id}"
}

resource "aws_instance" "bastion" {
	ami = "${var.aws_amazon_linux_ami}"
	availability_zone = "us-east-1b"
	instance_type = "t2.micro"
	key_name = "${var.aws_key_name}"
	vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
	subnet_id = "${aws_subnet.us-east-1b-public.id}"
	tags {
		Name = "bastion",
		Env = "Test"
	}
}

resource "aws_eip" "bastion" {
	instance = "${aws_instance.bastion.id}"
	vpc = true
}