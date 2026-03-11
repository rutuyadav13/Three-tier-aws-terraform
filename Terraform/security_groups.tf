resource "aws_security_group" "frontend_alb_sg" {

  name        = "frontend-alb-sg"
  description = "Allow HTTP traffic from internet to Frontend ALB"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    description = "Allow HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend-alb-sg"
  }

}

resource "aws_security_group" "frontend_server_sg" {

  name        = "frontend-server-sg"
  description = "Allow traffic from Frontend ALB to Frontend EC2"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    description     = "Allow HTTP from Frontend ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_alb_sg.id]
  }

  ingress {
    description = "Allow SSH for admin access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend-server-sg"
  }

}

resource "aws_security_group" "backend_alb_sg" {

  name        = "backend-alb-sg"
  description = "Allow traffic from frontend servers to backend ALB"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    description     = "Allow HTTP from frontend servers"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_server_sg.id]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-alb-sg"
  }

}

resource "aws_security_group" "backend_server_sg" {

  name        = "backend-server-sg"
  description = "Allow traffic from Backend ALB to Backend EC2"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    description     = "Allow HTTP from Backend ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_alb_sg.id]
  }

  ingress {
    description = "Allow SSH for admin access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-server-sg"
  }

}
resource "aws_security_group" "database_sg" {

  name        = "database-sg"
  description = "Allow MySQL access from backend servers"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    description     = "Allow MySQL from backend servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_server_sg.id]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "database-sg"
  }

}