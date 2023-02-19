# resource "github_repository" "test_repo" {
#   name        = "IaC_repo"
#   visibility  = "public"
#   description = "Terraform IaC provisioning"
# }

resource "aws_instance" "myec2" {
  instance_type          = "t2.micro"
  count                  = 2
  ami                    = data.aws_ami.ec_ami.id
  vpc_security_group_ids = [aws_security_group.sg_test.id]
  key_name               = "EC2 Tutorial"
  # ami           = lookup(var.ami, var.region)
  tags = {
    Name = element(var.ec2name, count.index)
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./EC2Tutorial.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y"
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum uninstall nginx -y"
    ]
  }

  provisioner "local-exec" {
    command = "echo $PWD"
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
