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


resource "aws_iam_role_policy" "test_policy" {
    name = "test_policy"
    role = "${aws_iam_role.WordPressAppServerRole.id}"
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


resource "aws_iam_role_policy_attachment" "test-attach" {
    role = "${aws_iam_role.role.name}"
    policy_arn = "${aws_iam_policy.policy.arn}"
}