# Public subnet for az b
resource "aws_subnet" "enve-dami-public-sn-1b" {
  vpc_id     = aws_vpc.enve-dami-vpc.id
  cidr_block = var.enve-dami-sn-a-cidr
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    type = "enve-dami-public-sn-1b"
    Name = "enve-dami-public-sn-1b"
  }
}


resource "aws_route_table" "enve-dami-rt-public-a" {
  vpc_id = "${aws_vpc.enve-dami-vpc.id}"

  tags = {
    type = "enve-dami-rt-public-a"
    Name = "enve-dami-rt-public-a"
  }
}


resource "aws_route" "enve-dami-int-route-a" {
  route_table_id         = "${aws_route_table.enve-dami-rt-public-a.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.enve-dami-igw.id}"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route_table_association" "enve-dami-rt-assoc-a" {
  subnet_id      = "${aws_subnet.enve-dami-public-sn-1b.id}"
  route_table_id = "${aws_route_table.enve-dami-rt-public-a.id}"

  lifecycle {
    ignore_changes        = [subnet_id, route_table_id]
    create_before_destroy = true
  }
}


# Private subnet for az b
resource "aws_subnet" "enve-dami-private-sn-2b" {
  vpc_id     = "${aws_vpc.enve-dami-vpc.id}"
  cidr_block = "${var.enve-dami-private-sn-a-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    type = "enve-dami-private-sn-2b"
    Name = "enve-dami-private-sn-2b"
  }
}


resource "aws_route_table" "enve-dami-rt-private-a" {
  vpc_id = aws_vpc.enve-dami-vpc.id

  tags = {
    type = "enve-dami-rt-private-a"
    Name = "enve-dami-rt-private-a"
  }
}


resource "aws_route_table_association" "enve-dami-rt-private-assoc-a" {
  subnet_id      = aws_subnet.enve-dami-private-sn-2b.id
  route_table_id = aws_route_table.enve-dami-rt-private-a.id

  lifecycle {
    ignore_changes        = [subnet_id, route_table_id]
    create_before_destroy = true
  }
}



# Nat gateway

resource "aws_nat_gateway" "enve-dami-nat-gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.enve-dami-public-sn-1b.id
  tags = {
    Name = "enve-dami-nat-gateway"
  }
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_route" "enve-dami-int-private-route-a" {
  route_table_id         = aws_route_table.enve-dami-rt-private-a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id             = aws_nat_gateway.enve-dami-nat-gateway.id
                        
  lifecycle {
    create_before_destroy = true
  }
}


