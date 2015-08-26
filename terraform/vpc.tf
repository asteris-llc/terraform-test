resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_subnet_ipv4}" 
  enable_dns_hostnames = true
  tags {
    Name = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
   vpc_id = "${aws_vpc.main.id}"
   cidr_block = "${var.private_subnet_ipv4}"
   availability_zone = "${var.availability_zone}"
   tags {
     Name = "${var.environment}"
  }
}

resource "aws_subnet" "public" {
   vpc_id = "${aws_vpc.main.id}"
   cidr_block = "${var.public_subnet_ipv4}"
   availability_zone = "${var.availability_zone}"
   tags {
     Name = "${var.environment}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "${var.environment}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.environment}"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}







