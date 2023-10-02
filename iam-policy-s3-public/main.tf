resource "aws_iam_policy" "public" {
  name = "${var.s3_bucket}-policy"
  policy = data.aws_iam_policy_document.public.json
}

data "aws_iam_policy_document" "public" {
  statement {
    sid = "AllowAll"

    principals {
      type = "AWS"
      identifiers = ["*"]
    }

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