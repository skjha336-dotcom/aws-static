variable "aws_profile" {
  description = "Optional AWS CLI profile to use (empty = default credential chain)"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
