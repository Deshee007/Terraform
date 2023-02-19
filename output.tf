output "sg_test" {
  value = aws_security_group.sg_test.ingress
}

output "ami_id" {
  value = aws_instance.myec2[*].ami
}
