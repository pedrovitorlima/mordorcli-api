variable "aws_region" {
  description = "AWS region for the project"
  type = string
  default = "ap-southeast-2"
}

variable "suffix" {
  description = "Prefix for resources in which the names needs to be unique across all AWS accounts"
  type = string
  default = "pr"
}