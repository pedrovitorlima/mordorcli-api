resource "aws_s3_bucket" "lambdas_codebase" {
  bucket = format("lambda-codebase-%s", var.suffix)
}

resource "aws_s3_object" "lambda_get_function" {
  bucket = aws_s3_bucket.lambdas_codebase.id

  key    = "get.zip"
  source = data.archive_file.lambda_get.output_path

  etag = filemd5(data.archive_file.lambda_get.output_path)
}

resource "aws_s3_object" "lambda_post_function" {
  bucket = aws_s3_bucket.lambdas_codebase.id

  key    = "post.zip"
  source = data.archive_file.lambda_post.output_path

  etag = filemd5(data.archive_file.lambda_post.output_path)
}