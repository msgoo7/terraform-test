variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment for the app"
  type        = string
  default     = "dev"
}

#This application varient is used to contribute in dynamic naming convention only
variable "application" {
  description = "Name of the application"
  type        = string
  default     = "neo-01"
}

variable "project" {
  description = "Name of the project"
  type        = string
  default     = "project-neo-01"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "managed_by"  = "Terraform"
    "application" = "Neutron"
  }
}

variable "lambda_image" {
  description = "Name of the lambda image"
  type        = string
  default     = ""
}


variable "lambda_timeout" {
  default = "300"
}

variable "lambda_memory_size" {
  default = "4096"
}
