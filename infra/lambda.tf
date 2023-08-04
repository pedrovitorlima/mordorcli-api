resource "aws_lambda_function" "get_function" {
  function_name = "get"

  s3_bucket = aws_s3_bucket.lambdas_codebase.id
  s3_key    = aws_s3_object.lambda_get_function.key

  runtime = "python3.9"
  handler = "app.lambda_handler"

  source_code_hash = data.archive_file.lambda_get.output_base64sha256

  role = aws_iam_role.lambda_exec.arn

  timeout = 15
}

resource "aws_lambda_function" "post_function" {
  function_name = "post"

  s3_bucket = aws_s3_bucket.lambdas_codebase.id
  s3_key    = aws_s3_object.lambda_post_function.key

  runtime = "python3.9"
  handler = "app.lambda_handler"

  source_code_hash = data.archive_file.lambda_post.output_base64sha256

  role = aws_iam_role.lambda_exec.arn

  timeout = 15
}

resource "aws_lambda_function_url" "get_url" {
  function_name = aws_lambda_function.get_function.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_function_url" "post_url" {
  function_name = aws_lambda_function.post_function.function_name
  authorization_type = "NONE"
}