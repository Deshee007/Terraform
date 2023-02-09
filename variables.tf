variable "ip_range" {}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1" = "ami-0aa7d40eeae50c9a9"
    "us-east-1" = "ami-0aa7d40eeae50c9a9"
  }
}

variable "ec2name" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}
