resource "aws_security_group" "enve-ec2-web-server-sg" {
  name = "enve-ec2-web-server-sg"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}