variable "availability_zone" {}
variable "environment" {default = "aura-poc"}

variable "ssh_key" {default = "~/.ssh/id_rsa.pub"}
variable "ssh_username" {default = "ec2-user"}

variable "vpc_subnet_ipv4" {default = "10.1.0.0/16"}
variable "private_subnet_ipv4" {default = "10.1.2.0/24"}
variable "public_subnet_ipv4" {default = "10.1.1.0/24"}

variable "ecs_ami" {}
variable "ecs_instance_type" {default = "t2.micro"}
variable "ecs_instance_count" {default = 1}

variable "nat_ami" {}
variable "nat_instance_type" {default = "t2.micro"}
