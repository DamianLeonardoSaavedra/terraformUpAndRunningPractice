resource "aws_autoscaling_group""enve-ec2-web-server-asg" {
  launch_configuration = aws_launch_configuration.enve-ec2-web-server.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "enve-ec2-web-server-asg"
    propagate_at_launch = true
  }
}