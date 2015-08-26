resource "aws_key_pair" "deployer" {
  key_name = "key-terraform-${var.environment}"
  public_key = "${file(var.ssh_key)}"
}
