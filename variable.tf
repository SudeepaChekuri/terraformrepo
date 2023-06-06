variable "aws_region" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  default     = "10.0.0.0/24"
}

variable "s3_bucket_name" {
  description = "S3 Bucket"
  default     = "terfbuc"
}

variable "ec2_ami" {
  description = "EC2 AMI ID"
  default     = "ami-0607784b46cbe5816"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}
