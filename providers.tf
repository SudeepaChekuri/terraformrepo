provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

}
provider "aws" {
  region = "ap-south-1"
