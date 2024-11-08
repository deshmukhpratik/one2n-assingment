variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "bucket_content_path" {
  description = "The path to the content inside the bucket"
  type        = string
}

variable "availability_zone" {
  description = "The path to the content inside the bucket"
  type        = string
}
