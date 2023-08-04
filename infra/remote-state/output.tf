output "bucket_name" {
  description = "Bucket name used for the backend"
  value = aws_s3_bucket.terraform_state.bucket_domain_name
}