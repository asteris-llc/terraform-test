resource "aws_security_group" "application" {
  name = "application" 

  vpc_id = "${aws_vpc.main.id}"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port = 80 
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
 
  ingress {
    from_port = 443
    to_port = 443 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
    ingress { # ICMP
    from_port=-1
    to_port=-1
    protocol = "icmp"
    cidr_blocks=["0.0.0.0/0"]
  }
  
  tags {
    Name = "${var.environment}-application-sg"
  }

}

resource "aws_security_group" "nat" {

  name = "nat" 

  vpc_id = "${aws_vpc.main.id}"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port = 80 
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
 
  ingress {
    from_port = 443
    to_port = 443 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
  ingress { # ICMP
    from_port=-1
    to_port=-1
    protocol = "icmp"
    cidr_blocks=["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_subnet_ipv4}"]
  }

  egress {
   from_port = -1
   to_port = -1
   protocol = "icmp"
   cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.environment}-nat-sg"
  }
}
