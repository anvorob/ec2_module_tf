variable "subnet_id" {
  type = string
  description = "Subnet ID"
}

variable "key_name" {
  type = string
  description = "Key name"
}

variable "sg_list" {
  type = list
  description = "List of Security Groups"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}

variable "name" {
  type = string
  description = "EC2 instance name"
}
