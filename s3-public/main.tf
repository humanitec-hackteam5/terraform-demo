resource "aws_s3_bucket" "main" {
  bucket = var.bucket
}

#resource "aws_s3_bucket_public_access_block" "main" {
#  bucket = aws_s3_bucket.main.id
#
#  block_public_acls   = false
#  block_public_policy = false
#}