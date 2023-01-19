variable "cosmos_db_account_name" {
  default = ""
}

variable "rg_location" {
  default = ""
}

variable "rg01_name" {
  default = ""
}

variable "db_offer_type" {
  default = ""
}

variable "db_kind" {
  default = ""
}

variable "db_enable_automatic_failover" {
  default = ""
}

variable "db_consistency_level" {
  default = ""
}

variable "failover_location" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "db_ip_range_filter" {
  type = list(string)
  default = []
}

variable "cosmos_capabilities" {
  default = ""
}

variable "tags" {
  default = ""
}

variable "cosmos_capabilities_db" {
  default = ""
}


