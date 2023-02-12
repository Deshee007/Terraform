# resource "github_repository" "test_repo" {
#   name        = "IaC_repo"
#   visibility  = "public"
#   description = "Terraform IaC provisioning"
# }

resource "aws_instance" "test_ec2" {
  instance_type   = "t2.micro"
  count           = 2
  ami             = data.aws_ami.ec_ami.id
  security_groups = ["sg_test"]
  # ami           = lookup(var.ami, var.region)
  tags = {
    Name = element(var.ec2name, count.index)
  }
}

resource "aws_security_group" "sg_test" {
  name = "dynamic-sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port

    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_range]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_range]
    }
  }
}
