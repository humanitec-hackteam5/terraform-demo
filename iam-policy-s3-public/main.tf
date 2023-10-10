resource "aws_iam_policy" "main" {
  name        = "${var.s3_bucket}-s3-public"
  description = "Allows public access to S3 bucket"
  policy      = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      var.s3_bucket_arn,
    ]
  }
}