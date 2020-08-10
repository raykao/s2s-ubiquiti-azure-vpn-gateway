variable "location" {
    description = "Azure Data Center Location"
}

variable "prefix" {
    description = "Prefix used for resource naming"
}

variable "shared-key" {
    default = ""
    description = "Pre-shared Key for VPN IPSec"
}

variable "onprem-pip" {
    description = "Public IP address of on-prem VPN device"
}

variable "onprem-address-space" {
    description = "Private network address space of on-prem network"
}