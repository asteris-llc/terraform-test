resource "aws_ecs_cluster" "ecs" {
  name = "${var.environment}"
}

resource "aws_instance" "ecs-nodes" {
  ami = "${var.ecs_ami}"
  availability_zone = "${var.availability_zone}"
  instance_type = "${var.ecs_instance_type}"
  count = "${var.ecs_instance_count}"

  key_name = "${aws_key_pair.deployer.key_name}"

  subnet_id = "${aws_subnet.private.id}"

  vpc_security_group_ids = [ "${aws_security_group.application.id}",
                             "${aws_vpc.main.default_security_group_id}"]

  root_block_device {
    delete_on_termination = true
  }

  tags {
    Name = "${var.environment}-ecs-${format("%03d", count.index+1)}"
    sshUser = "${var.ssh_username}"
  }

}
