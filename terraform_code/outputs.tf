# Outputs
output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "instance_public_ip" {
  value = aws_instance.http_service.public_ip
}
