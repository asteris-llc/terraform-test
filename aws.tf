provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

module "aura-poc" {
  source = "./terraform"
  availability_zone = "us-east-1e"
  environment = "aura-poc"
  ecs_ami = "ami-b540eade" #us-east-1
  ecs_instance_type = "t2.micro"
  ecs_instance_count = 1
  nat_ami = "ami-303b1458"  #us-east-1
}
