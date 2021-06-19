resource "aws_vpc" "enve-dami-vpc" {
  cidr_block = var.enve-dami-vpc-cidr
  
  tags = {
    type = "enve-dami-vpc"
    Name = "enve-dami-vpc"
  }

}

resource "aws_internet_gateway" "enve-dami-igw" {
  vpc_id = aws_vpc.enve-dami-vpc.id

  tags = {
    type = "enve-dami-igw"
    Name = "enve-dami-igw"
  }

}