variable "region" {
  type = string
}

variable "credentials" {
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "prefix" {
  type = string
}
variable "sqs_queue_arn" {
  type = string
}