output "sg_test" {
  value = aws_security_group.sg_test.ingress
}

output "ami_id" {
  value = aws_instance.test_ec2[0].ami
}
