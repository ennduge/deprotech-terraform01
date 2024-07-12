variable "ami" {
  type        = string
  description = "provide ami ID"
}

variable "instance-type" {
  type        = string
  description = "provide instance type"
}

variable "key-name" {
  type        = string
  description = "provide key pair name"
}

variable "region" {
  type        = string
  description = "provide region"
}

variable "common_tags" {
  type        = map(string)
  description = "a map of tags to apply to resources"

}

variable "az" {
  type        = string
  description = "provide az"
}