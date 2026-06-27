variable "aws_region" {
  description = "AWS region for this project"
  type        = string
  default     = "ap-northeast-2"
}

variable "project_name" {
  description = "Prefix for AWS resource names"
  type        = string
  default     = "secure-ecs-oidc"
}

variable "github_org" {
  description = "GitHub organization or user ID"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}
