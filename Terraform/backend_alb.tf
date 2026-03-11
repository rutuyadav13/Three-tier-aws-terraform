resource "aws_lb" "backend_alb" {

  name               = "backend-alb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.backend_alb_sg.id
  ]

  subnets = [
    aws_subnet.web_private_1a.id,
    aws_subnet.web_private_1b.id,
    aws_subnet.web_private_1c.id
  ]

  tags = {
    Name = "backend-alb"
  }

}

resource "aws_lb_target_group" "backend_tg" {

  name     = "backend-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.three_tier_vpc.id

  health_check {

    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

  }

  tags = {
    Name = "backend-target-group"
  }

}
resource "aws_lb_listener" "backend_listener" {

  load_balancer_arn = aws_lb.backend_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn

  }

}