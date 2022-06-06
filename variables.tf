variable "instance_name" {
    type = string
}

variable "enviornment" {
    type    = string
    default = substr("production", 0, 1)
}

variable "region" {
    type = string 
}

variable "zone" {
    type = string 
}

variable "machine_type" {
    type = string
    default = "n2-standard"

    validation {
        condition     = "n2-standard"
        error_message = "This machine type is invalid."
    }
}

variable "network_id" {
    type    = string
    default = "network-prod"
}

variable "public_ip" {
    type    = bool
    default = "false"
}

variable "labels" {
    type = object ({
        name = string
        foo  = number 
    })
}
variable "root_password" {
    type = string
}
