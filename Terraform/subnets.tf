resource "aws_subnet" "web_public_1a" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "web-public-1a"
  }
}

resource "aws_subnet" "web_public_1b" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true

  tags = {
    Name = "web-public-1b"
  }
}

resource "aws_subnet" "web_public_1c" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "web-public-1c"
  }
}

resource "aws_subnet" "web_private_1a" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "web-private-1a"
  }
}

resource "aws_subnet" "web_private_1b" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "web-private-1b"
  }
}

resource "aws_subnet" "web_private_1c" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "web-private-1c"
  }
}

resource "aws_subnet" "app_private_1a" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.7.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "app-private-1a"
  }
}

resource "aws_subnet" "app_private_1b" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "app-private-1b"
  }
}

resource "aws_subnet" "app_private_1c" {

  vpc_id = aws_vpc.three_tier_vpc.id
  cidr_block = "10.0.9.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "app-private-1c"
  }
}