resource "aws_iam_role" "neutron_lambda" {
  name = "${var.environment}-${var.region}-${var.application}-lambda-role"

  inline_policy {
    name = "lambda_policy"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "Stmt1615884601887",
          "Action" : [
            "s3:DeleteObject",
            "s3:GetObject",
            "s3:PutObject",
            "s3:PutObjectAcl"
            "comprehend:*",
            "s3:ListAllMyBuckets",
            "s3:ListBucket",
            "s3:GetBucketLocation",
            "iam:ListRoles",
            "iam:GetRole"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1615884633560",
          "Action" : "logs:*",
          "Effect" : "Allow",
          "Resource" : "*"
        }
      ]
    })
  }

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })

  tags = merge(
    var.tags,
    map(
      "project", var.project,
      "environment", var.environment
    )
  )

}
