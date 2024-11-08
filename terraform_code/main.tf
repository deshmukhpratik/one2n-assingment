# Create the S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# Create an empty object in dir1 to simulate an empty directory
resource "aws_s3_object" "dir1" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "dir1/"  # This will create an empty marker for the dir1 folder
  content = ""      # Empty content to simulate an empty directory
}

# Create an object in dir2
resource "aws_s3_object" "dir2_file1" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "dir2/file1"  # This will create file1 inside dir2
  content = "This is file1 in dir2"
}

# Create another object in dir2
resource "aws_s3_object" "dir2_file2" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "dir2/file2"  # This will create file2 inside dir2
  content = "This is file2 in dir2"
}

# Security group to allow HTTP traffic
resource "aws_security_group" "sg" {
  name_prefix = "http_service_sg"
  description = "Allow HTTP traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# IAM Role for EC2 to access the S3 bucket
resource "aws_iam_role" "ec2_role" {
  name               = "ec2-s3-access-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

# IAM Policy to allow S3 access
resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Policy to allow EC2 access to S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.bucket.bucket}/*"
        ]
      }
    ]
  })
}

# Attach the policy to the EC2 role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}


# EC2 Instance to run the HTTP service
resource "aws_instance" "http_service" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id  
  availability_zone = var.availability_zone
  vpc_security_group_ids = [aws_security_group.sg.id]  # Correct usage of security group
  iam_instance_profile   = aws_iam_instance_profile.ec2_role.name
  associate_public_ip_address = true
  root_block_device {
    volume_size = 30
  }  
  
  user_data = file("${path.module}/install.sh")

  tags = {
    Name = "HTTP Service Instance"
  }
}


# IAM Instance Profile for EC2 to assume the role
resource "aws_iam_instance_profile" "ec2_role" {
  name = "ec2-s3-access-instance-profile"
  role = aws_iam_role.ec2_role.name
}
