param(
	$name = "scaleable-wordpress"
)
aws.exe ec2 delete-key-pair --key-name $name
aws.exe ec2 create-key-pair --key-name $name --query 'KeyMaterial' --output text | out-file -encoding ascii "$name.pem"