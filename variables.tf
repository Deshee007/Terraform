variable "ip_range" {}

# variable "ami" {
#   type = map(any)
#   default = {
#     "us-east-1" = "ami-0aa7d40eeae50c9a9"
#     "us-east-1" = "ami-0aa7d40eeae50c9a9"
#   }
# }

variable "ec2name" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "region" {
  default = "us-east-1"
}


variable "sg_ports" {
  type    = list(number)
  default = [22, 8080, 8081, 3000, 5000]
}
