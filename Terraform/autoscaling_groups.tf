resource "aws_autoscaling_group" "frontend_asg" {

  desired_capacity = 2
  max_size         = 3
  min_size         = 2

  vpc_zone_identifier = [
    aws_subnet.web_private_1a.id,
    aws_subnet.web_private_1b.id,
    aws_subnet.web_private_1c.id
  ]

  launch_template {
    id      = aws_launch_template.frontend_lt.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.frontend_tg.arn
  ]

}

resource "aws_autoscaling_group" "backend_asg" {

  desired_capacity = 2
  max_size         = 3
  min_size         = 2

  vpc_zone_identifier = [
    aws_subnet.app_private_1a.id,
    aws_subnet.app_private_1b.id,
    aws_subnet.app_private_1c.id
  ]

  launch_template {
    id      = aws_launch_template.backend_lt.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.backend_tg.arn
  ]

}