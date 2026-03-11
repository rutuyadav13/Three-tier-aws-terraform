# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "three_tier_vpc" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "three-tier-vpc"
  }
}

# -------------------------
# Internet Gateway
# -------------------------
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "three-tier-igw"
  }
}

# -------------------------
# Elastic IP for NAT
# -------------------------
resource "aws_eip" "nat_eip" {

  domain = "vpc"

  tags = {
    Name = "three-tier-nat-eip"
  }
}

# -------------------------
# NAT Gateway
# -------------------------
resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "three-tier-nat-gateway"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}
