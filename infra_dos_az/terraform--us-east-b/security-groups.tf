resource "aws_security_group" "enve-dami-sg" {
  name = "enve-dami-sg"
  description = "Learnig platform dev env security group"
  vpc_id      = "${aws_vpc.enve-dami-vpc.id}"

  ingress {
    from_port       = "${var.ssh-port}"
    to_port         = "${var.ssh-port}"
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = "${var.http-port}"
    to_port         = "${var.http-port}"
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags = {
    Name = "enve-dami-sg"
 }

}