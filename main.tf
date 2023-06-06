terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.62.0"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "terfbuc" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block
}

resource "aws_instance" "my_instances" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.my_subnet.id
  count         = 2
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "instance_public_ips" {
  value = aws_instance.my_instances.*.public_ip
}
