variable "prefix" {
    type = "string"
    default = "dockerTest"
    description = "preix to use on resources"
}

variable "aws_region" {
	default = "us-west-2"
}

variable "environment" {
    default = "Test"
}

variable "vpc_cidr" {
    default = "10.150.0.0/16"
}

variable "terraform_tag_id" {
    default = "basic_vpc_12345"
}

variable "private_subnets"{
     type = "list"
     default = ["10.150.20.0/24", "10.150.21.0/24"]
}

variable "public_subnets"{
     type = "list"
     default = ["10.150.80.0/24", "10.150.81.0/24"]
}

variable "availability_zones" {
    type = "list"
    default = ["a", "b"]
}