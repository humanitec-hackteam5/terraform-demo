resource "aws_iam_policy" "secrets" {
  name = "${var.s3_bucket}-secrets"
  policy = data.aws_iam_policy_document.secrets.json
}

data "aws_iam_policy_document" "secrets" {
  statement {
    sid = "IPAllow"

    effect = "Deny"

    principals {
      type = "AWS"
      identifiers = ["*"]
    }

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