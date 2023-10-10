variable "region" {
  type = string
}

variable "credentials" {
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "s3_bucket" {
  type = string
}
variable "s3_bucket_arn" {
  type = string
}