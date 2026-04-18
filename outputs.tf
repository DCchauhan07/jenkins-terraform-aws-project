output "ec2_public_ip" {
  value = aws_instance.demo_ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}

output "security_group_id" {
  value = aws_security_group.demo_sg.id
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}
