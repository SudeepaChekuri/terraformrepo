terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.62.0"
    }
  }
}
variable "aws_region" {
  description = "AWS Region"
  default     = "ap-south-1"

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket Name"
  #default     = "terfbuc"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  description = "Subnet CIDR block"
  default     = "10.0.0.0/24"
}

variable "ec2_ami" {
  type        = string
  description = "EC2 AMI ID"
  default     = "ami-0607784b46cbe5816"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

resource "aws_key_pair" "example" {
  key_name   = "myKP" 
  public_key = file("~/.ssh/id_rsa.pub")
  
resource "aws_instance" "terraform_instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.example.key_name
}
  
resource "aws_instance" "terraform_instance2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.example.key_name
  
}
  
resource "aws_s3_bucket" "my_bucket" {
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
