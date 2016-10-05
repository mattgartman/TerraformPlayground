output bastion_ip {
    value ="${aws_instance.bastion.public_ip}"
}

output bastion_key_name {
    value ="${aws_instance.bastion.key_name}"
}

output wordpress_app1_ip {
    value = "${aws_instance.wordpress1.private_ip}"
}

output wordpress_app2_ip {
    value = "${aws_instance.wordpress2.private_ip}"
}