resource "aws_instance" "enve-dami-ec2-public-srvr1b" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = var.key-name
  vpc_security_group_ids = [aws_security_group.enve-dami-sg.id]
  subnet_id = aws_subnet.enve-dami-public-sn-1b.id

  tags = {
    Name = "enve-dami-ec2-public-srvr1b"
  }
}

resource "aws_instance" "enve-dami-ec2-private-srvr2b" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name      = var.key-name
  vpc_security_group_ids = [aws_security_group.enve-dami-sg.id]
  subnet_id = aws_subnet.enve-dami-private-sn-2b.id
  associate_public_ip_address = "false"

  tags = {
    Name = "enve-dami-ec2-private-srvr2b"
  }
}