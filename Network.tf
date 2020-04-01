
resource "aws_vpc" "tf-vpc" {
  cidr_block       = "${var.vpc-cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "tf-subnet" {
  count    = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${aws_vpc.tf-vpc.id}"
  cidr_block = "${element(var.subnet-cidr,count.index)}"

  tags = {
    Name = "tf-subnet-${count.index+1}"
  }
}