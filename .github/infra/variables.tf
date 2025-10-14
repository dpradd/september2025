variable "resource_group_name" {
  type    = string
  default = "rg-github-actions-demo"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "acr_name" {
  type    = string
  description = "Unique ACR name (lowercase, 5-50 chars)."
  default = "dprdemotesttestt" # change to something unique
}

variable "containerapps_env_name" {
  type    = string
  default = "demo-environment"
}

variable "container_app_name" {
  type    = string
  default = "demo-app"
}

variable "container_image" {
  type    = string
  default = ""
  description = "Full image name, e.g. myacr.azurecr.io/myapp:tag (set in second apply)"
}
