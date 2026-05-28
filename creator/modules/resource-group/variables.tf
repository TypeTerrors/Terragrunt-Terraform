# These variables are the contract that Terragrunt or any other caller must satisfy.
# The module stays reusable by accepting values instead of hardcoding environment details.
variable "name" {
    type        = string
    default     = null
    description = "value"
}

variable "workflow_name" {
    type        = string
    description = "value"
}

variable "stage_name" {
    type        = string
    description = "value"
}

variable "location" {
    type        = string
    description = "value"
}

variable "location_code" {
    type        = string
    description = "value"
}

variable "tags" {
    type        = map(string)
    description = "Tags applied to resource group"
    default     = {}
}
