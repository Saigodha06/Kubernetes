### Vnet Compute ###


variable "rg_location" {
  default = ""
}

variable "rg01_name" {
  default = ""
}

variable "vnet01_name" {
  default = ""
}

variable "vnet01_address_space" {
  default = ""
}

variable "ddosplan_name" {
  default = ""
}

### Subnet01 for Vnet Compute ###

variable "subnet01_name" {
  default = ""
}

variable "subnet01_address_prefix" {
  default = ""
}

variable "subnet_service_endpoints" {
  default = ""
}


### Subnet02 for Vnet Compute ###

variable "subnet02_name" {
  default = ""
}
variable "subnet02_address_prefix" {
  default = ""
}


### NSG for Subnet01 ###

variable "nsg01_name" {
  default = ""
}



### NSG for Subnet02 ###

variable "nsg02_name" {
  default = ""
}

variable "tags" {
  default = ""
}