resource "aws_lb" "frontend_alb" {

  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.frontend_alb_sg.id
  ]

  subnets = [
    aws_subnet.web_public_1a.id,
    aws_subnet.web_public_1b.id,
    aws_subnet.web_public_1c.id
  ]

  tags = {
    Name = "frontend-alb"
  }

}

resource "aws_lb_target_group" "frontend_tg" {

  name     = "frontend-target-group"
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
    Name = "frontend-target-group"
  }

}

resource "aws_lb_listener" "frontend_listener" {

  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_tg.arn

  }

}