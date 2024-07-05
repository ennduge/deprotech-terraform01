resource "aws_instance" "deprotech" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  #security_groups = "sg-0ab27262fe996d5f9"

  tags = {
    Name = "deprotech"
    Env  = "dev-env"
  }
}
##################################################################
#  NETWORK RESOURCE
##################################################################

resource "aws_vpc" "deprotech-vpc" {
  cidr_block       = var.vpc-cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "deprotech-vpc"
    Env  = "dev"
  }
}

resource "aws_subnet" "deprotech-priv-SN" {
  vpc_id     = aws_vpc.deprotech-vpc.id
  cidr_block = var.vpc-cidr_block

  tags = {
    Name = "deprotech-priv-SN"
  }
}

resource "aws_subnet" "deprotech-pub-SN" {
  vpc_id     = aws_vpc.deprotech-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "deprotech-pub-SN"
  }
}

resource "aws_route_table" "deprotech-Public-RT" {
  vpc_id = aws_vpc.deprotech-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deprotech-IGW.id
  }

  tags = {
    Name = "deprotech-Public-RT"
  }
}

resource "aws_route_table" "deprotech-Private-RT" {
  vpc_id = aws_vpc.deprotech-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.deprotech-NGW.id
  }

  tags = {
    Name = "deprotech-Private-RT"
  }
}

resource "aws_route_table_association" "deprotech-pub-RT-ASS" {
  subnet_id      = aws_subnet.deprotech-pub-SN.id
  route_table_id = aws_route_table.deprotech-Public-RT.id
}

resource "aws_route_table_association" "deprotech-priv-RT-ASS" {
  subnet_id      = aws_subnet.deprotech-priv-SN.id
  route_table_id = aws_route_table.deprotech-Private-RT.id
}

resource "aws_internet_gateway" "deprotech-IGW" {
  vpc_id = aws_vpc.deprotech-vpc.id

  tags = {
    Name = "deprotech-IGW"
  }
}

resource "aws_nat_gateway" "deprotech-NGW" {
  #allocation_id = aws_eip.deprotech-NAT.id
  subnet_id     = aws_subnet.deprotech-priv-SN.id
}
/*
  resource "aws_eip" "deprotech-NAT" { 
  vpc = true}
*/
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.deprotech-vpc.id

  #INBOUND RULE
  ingress {
    description = "allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow HTTPs inbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #OUTBOUND RULE
  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}