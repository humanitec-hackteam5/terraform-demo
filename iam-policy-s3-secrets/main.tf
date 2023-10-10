resource "aws_iam_policy" "main" {
  name        = "${var.s3_bucket}-s3-public"
  description = "Allows access to S3 bucket to IP subnet"
  policy      = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    sid = "IPAllow"

    effect = "Deny"

    actions = [
      "s3:*",
    ]

    resources = [
      var.s3_bucket_arn,
    ]

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values = [
        "54.240.143.0/24"
      ]
    }

  }
}