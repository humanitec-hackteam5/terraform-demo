variable "region" {
  type = string
}

variable "bucket" {
  type = string
}

variable "credentials" {
  type = object({
    access_key = string
    secret_key = string
  })
}