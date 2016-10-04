resource "aws_iam_role" "WordPressAppServerRole" {
    name = "WordPressAppServerRole"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "WordPressAppServerPolicy" {
    name = "WordPressAppServerPolicy"
    path = "/"
    description = "Wordpress App Server Policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "WordPressAppServerPolicy-attach" {
    role = "${aws_iam_role.WordPressAppServerRole.name}"
    policy_arn = "${aws_iam_policy.WordPressAppServerPolicy.arn}"
}

resource "aws_iam_instance_profile" "WordPressAppServerPolicyProfile" {
    name = "WordPressAppServerPolicyProfile"
    roles = ["${aws_iam_role.WordPressAppServerRole.name}"]
}