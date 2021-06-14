provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "enve-ec2-web-server" {
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.enve-ec2-web-server-sg.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

tags = {
    Name = "enve-ec2-web-server"
  }
}