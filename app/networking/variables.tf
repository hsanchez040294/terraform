svariable "region" {
    type = string
    description = "Region de AWS"
    default = "eu-west-1"
}

variable "network_cid_vpc" {
  description = "red vpc"
  //type        = map(string)
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_count" {
  //type        = map(number)
  type        = number
  description = "Count of subnets"
  default     = 2
}
/*variable "private_subnets" {
    type = list(string)
  
}

variable "public_subnets" {
    type = list(string)
  
}*/