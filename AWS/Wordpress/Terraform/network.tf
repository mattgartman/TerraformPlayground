#vpc examples https://github.com/hectcastro/terraform-aws-vpc

resource "aws_vpc" "wordpress_vpc" {
    cidr_block = "172.16.0.0/20"
    tags {
        Name = "wordpress_vpc",
        Env = "Test"
    }
}

resource "aws_internet_gateway" "internetgw" {
	vpc_id = "${aws_vpc.wordpress_vpc.id}"
}






