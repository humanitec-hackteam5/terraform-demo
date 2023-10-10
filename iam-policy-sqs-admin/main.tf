resource "aws_iam_policy" "main" {
  name        = "${var.prefix}-sqs-admin"
  description = "Admin access to sqs bucket"
  policy      = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    actions = [
      "sqs:*",
    ]

    resources = [
      var.sqs_queue_arn,
    ]
  }
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = "Admin"
  policy_arn = aws_iam_policy.main.arn
}