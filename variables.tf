
variable "vpc-cidr" {
  type = string
  default = "192.168.1.0/24"
}

variable "subnet-cidr" {
  type = list(string)
  default = ["192.168.1.0/26","192.168.1.64/26","192.168.1.128/26"]
}


data "aws_availability_zones" "azs" {
  state = "available"
}