provider "aws" {
  region = "us-east-1"
}

resource "aws_launch_configuration" "enve-ec2-web-server" {
  image_id               = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  security_groups = [aws_security_group.enve-ec2-web-server-sg.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

lifecycle {
    create_before_destroy = true
  }
}