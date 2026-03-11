resource "aws_route_table" "public_route_table" {

  vpc_id = aws_vpc.three_tier_vpc.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.three_tier_igw.id

  }

  tags = {
    Name = "three-tier-public-rt"
  }

}

resource "aws_route_table_association" "web_public_1a_assoc" {

  subnet_id = aws_subnet.web_public_1a.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "web_public_1b_assoc" {

  subnet_id = aws_subnet.web_public_1b.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "web_public_1c_assoc" {

  subnet_id = aws_subnet.web_public_1c.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table" "private_route_table" {

  vpc_id = aws_vpc.three_tier_vpc.id

  route {

    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id

  }

  tags = {
    Name = "three-tier-private-rt"
  }

}

resource "aws_route_table_association" "web_private_1a_assoc" {

  subnet_id = aws_subnet.web_private_1a.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "web_private_1b_assoc" {

  subnet_id = aws_subnet.web_private_1b.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "web_private_1c_assoc" {

  subnet_id = aws_subnet.web_private_1c.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "app_private_1a_assoc" {

  subnet_id = aws_subnet.app_private_1a.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "app_private_1b_assoc" {

  subnet_id = aws_subnet.app_private_1b.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "app_private_1c_assoc" {

  subnet_id = aws_subnet.app_private_1c.id
  route_table_id = aws_route_table.private_route_table.id

}
