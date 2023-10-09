resource "aws_s3_bucket_policy" "secrets" {
  bucket = var.s3_bucket
  policy = data.aws_iam_policy_document.secrets.json
}

data "aws_iam_policy_document" "secrets" {
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