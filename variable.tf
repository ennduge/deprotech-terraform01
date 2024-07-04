variable "ami" {
    description = "provide AMI ID"
    type = string
    default = "ami-06c68f701d8090592"
  
}

variable "instance_type" {
    description = "provide instance type"
    type = string
    default = "t2.micro"
  
}

variable "key_name" {
    description = "provide a key name"
    type = string
    default = "postgres"
  
}

variable "availability_zone" {
    description = "provide availability zone"
    type = string
    default = "us-east-1a"
  
}