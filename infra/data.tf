data "archive_file" "lambda_get" {
  type = "zip"

  source_dir = "${path.module}/get-name-lambda"
  output_path = "${path.module}/get.zip"
}

data "archive_file" "lambda_post" {
  type = "zip"

  source_dir = "${path.module}/post-name-lambda"
  output_path = "${path.module}/post.zip"
}