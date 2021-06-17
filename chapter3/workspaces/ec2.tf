resource "aws_instance" "enve-dami-ec2" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
      Name = "enve-dami-ec2"
  }
}