# These variables define the public interface of the storage account module.
# Terragrunt examples on the creator and consumer sides both pass values through this contract.
variable "name" {
    type        = string
    description = "value"
    default     = null
    validation {
        condition     = var.name == null || can(regex("", var.name))
        error_message = "error message for not matching regex or var.name is null"
    }
}

variable "workload_code" {
    type        = string
    description = "value"
    validation {
        error_message = "value"
        condition     = can(regex("", var.workload_code))
    }
}

variable "stage_code" {
    type        = string
    description = "value"
    validation {
        error_message = "value"
        condition     = can(regex("", var.stage_code))
    }
}

variable "location" {
    type        = string
    description = "value"
}

variable "location_code" {
    type        = string
    description = "value"
    validation {
        error_message = "value"
        condition     = can(regex("", var.location_code))
    }
}

variable "instance" {
    type        = string
    description = "value"
    default     = "001"
    validation {
        error_message = "value"
        condition     = can(regex("", var.instance))
    }
}

variable "resource_group_name" {
    type        = string
    description = "value"
}

variable "account_tier" {
    type        = string
    description = "value"
    default     = "standard"
    validation {
        error_message = "value"
        condition     = can(regex("", var.account_tier))
    }
}

variable "account_replication_type" {
    type        = string
    description = "value"
    default     = "LRS"
    validation {
        error_message = "value"
        condition     = contains(["LRS", "GRS", "RAGRS"], var.account_replication_type)
    }
}

variable "min_tls_version" {
    type        = string
    description = "value"
    validation {
        error_message = "value"
        condition     = can(regex("", var.workload_code))
    }
}

variable "public_network_access_enable" {
    type        = bool
    description = "value"
    default     = true
}

variable "tags" {
    type        = map(string)
    description = "value"
    default     = {}
}
