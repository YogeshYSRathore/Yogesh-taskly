variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "staging"
}

variable "postgres_admin" {
  type    = string
  default = "tasklyadmin"
}

variable "postgres_password" {
  type      = string
  sensitive = true
}