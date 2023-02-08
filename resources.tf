resource "github_repository" "test_repo" {
  name        = "IaC_repo"
  visibility  = "public"
  description = "Terraform IaC provisioning"
}

resource "aws_instance" "test_ec2" {
  instance_type = "t2.micro"
  ami           = "ami-0aa7d40eeae50c9a9"
}

resource "aws_security_group" "sg_test" {
  name = "terraform_test"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.ip_range]
  }
}

output "sg_test" {
  value = aws_security_group.sg_test.ingress
}
