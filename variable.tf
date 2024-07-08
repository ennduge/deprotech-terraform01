variable "ami" {
  description = "provide AMI ID"
  type        = string
  default     = "ami-06c68f701d8090592"

}

variable "instance_type" {
  description = "provide instance type"
  type        = string
  default     = "t2.micro"

}

variable "key_name" {
  description = "provide a key name"
  type        = string
  default     = "postgress"

}

variable "availability_zone" {
  description = "provide availability zone"
  type        = string
  default     = "us-east-1b"

}

variable "vpc-cidr_block" {
  description = "provide a cidr_block for this private-SN"
  type        = string
  default     = "10.0.0.0/24"

}

variable "priv-SN-cidr_block" {
  description = "provide a cidr_block for this private-SN"
  type        = string
  default     = "10.0.1.0/24"

}

variable "deprotech-pub-cidr_block" {
  description = "provide a cidr_block for this public cidr_block"
  type        = string
  default     = "10.0.2.0/24"

}

variable "deprotech-public-RT" {
  description = "provide a cidr_block for this pulic RT"
  type        = string
  default     = "0.0.0.0/0"

}

variable "deprotech-private-RT" {
  description = "provide a cidr_block for this private RT"
  type        = string
  default     = "0.0.0.0/0"

}


/*
variable "HTTP-cidr_block" {
    description = "provide a cidr_block for inbound rules"
    type = string
    default = "0.0.0.0/0"
  
}

variable "HTTPS-cidr_block" {
    description = "provide a cidr_block for HHPS"
    type = string
    default = "0.0.0.0/0"
  
}

variable "SSH-cidr_block" {
    description = "provide a cidr_block for SSH"
    type = string
    default = "0.0.0.0/0"
  
}

variable "all-traffic_cidr_block" {
    description = "provide a cidr_block for all traffic"
    type = string
    default = "0.0.0.0/0"
  
}
*/