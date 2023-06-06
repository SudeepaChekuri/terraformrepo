variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
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
  description = "S3 Bucket Name"
  default     = "my-bucket"
}

variable "ec2_ami" {
  description = "EC2 AMI ID"
  default     = "ami-0123456789abcdef0"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}
