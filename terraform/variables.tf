variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "availability_zone" {
  description = "Availability zone to place resources in"
  type        = string
  default     = "us-east-2a"
}

variable "environment_tag" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "Base domain name for DNS module"
  type        = string
  default     = "example.com"
}

variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  type        = string
  default     = "10.1.0.0/24"
}

variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  type        = string
  default     = "10.2.0.0/24"
}

variable "public_key_path" {
  description = "Public key path"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "aws_profile" {
  description = "Optional AWS CLI profile to use (empty = default credential chain)"
  type        = string
  default     = ""
}
