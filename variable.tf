variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket Name"
  default     = "terfbuc"
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
