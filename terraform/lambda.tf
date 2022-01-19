resource "aws_lambda_function" "test_lambda_fn" {
  function_name = "${var.environment}-${var.region}-${var.application}-neutron"
  image_uri     = var.lambda_image
  package_type  = "Image"
  role          = aws_iam_role.neutron_lambda.arn
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_size
  environment {
    variables = {
    }
  }
  tags = merge(
    var.tags,
    map(
      "project", var.project,
      "environment", var.environment
    )
  )
}
