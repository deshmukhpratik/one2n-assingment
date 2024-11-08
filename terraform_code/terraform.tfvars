region           = "ap-south-1"                  # AWS region to deploy resources
bucket_name      = "one2n-app-bucket"           # S3 bucket name
instance_type    = "t3.medium"                   # EC2 instance type
key_name         = "Test"                        # SSH key pair name
ami_id           = "ami-09b0a86a2c84101e1"      # AMI ID for EC2 instance
subnet_id        = "subnet-0acc261d50458ac6a"   # Subnet ID for EC2 instance
bucket_content_path = ""                         # Path to content inside the S3 bucket (empty for top-level)
availability_zone = "ap-south-1a"
