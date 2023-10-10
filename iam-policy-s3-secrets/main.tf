resource "aws_iam_policy" "main" {
  name        = "${var.s3_bucket}-s3-secrets"
  description = "Admin access to S3 bucket"
  policy      = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      var.s3_bucket_arn,
    ]
  }
}