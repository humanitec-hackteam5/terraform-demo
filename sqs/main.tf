module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name            = var.queue
  use_name_prefix = true
}