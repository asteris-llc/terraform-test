resource "aws_instance" "nat" {
  ami = "${var.nat_ami}"
  availability_zone = "${var.availability_zone}"
  instance_type = "${var.nat_instance_type}"

  security_groups = ["${aws_security_group.nat.id}"]
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check = false

  tags {
    Name = "${var.environment}-vpc-nat" 
  }

}

resource "aws_eip" "nat" {
  instance = "${aws_instance.nat.id}"
  vpc = true
} 
