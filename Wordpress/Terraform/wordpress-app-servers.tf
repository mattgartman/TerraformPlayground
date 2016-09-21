resource "aws_security_group" "wordpress_app" {
	name = "wordpress_app"
	description = "Allow traffic from bastion"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		security_groups = ["${aws_security_group.bastion.id}"]
	}

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

	vpc_id = "${aws_vpc.wordpress_vpc.id}"
}

resource "aws_instance" "wordpress1" {
	ami = "${var.aws_amazon_linux_ami}"
	availability_zone = "us-east-1b"
	instance_type = "t2.micro"
	key_name = "${var.aws_key_name}"
	vpc_security_group_ids = ["${aws_security_group.wordpress_app.id}"]
	subnet_id = "${aws_subnet.us-east-1b-public.id}"
	tags {
		Name = "wordpress1",
		Env = "Test"
	}
}


resource "aws_instance" "wordpress2" {
	ami = "${var.aws_amazon_linux_ami}"
	availability_zone = "us-east-1c"
	instance_type = "t2.micro"
	key_name = "${var.aws_key_name}"
	vpc_security_group_ids = ["${aws_security_group.wordpress_app.id}"]
	subnet_id = "${aws_subnet.us-east-1c-public.id}"
	tags {
		Name = "wordpress2",
		Env = "Test"
	}
}