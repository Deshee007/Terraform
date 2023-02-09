resource "github_repository" "test_repo" {
  name        = "IaC_repo"
  visibility  = "public"
  description = "Terraform IaC provisioning"
}

variable "region" {
  default = "us-east-1"
}
resource "aws_instance" "test_ec2" {
  instance_type = "t2.micro"
  count         = 2
  ami           = lookup(var.ami, var.region)
  tags = {
    Name = element(var.ec2name, count.index)
  }
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
