variable "region" {
  type = "string"
  default = "us-central-1"
}
variable "vpc_name" {
  type = "string"
  default = "vpc_jing"
}
variable "subnet_name" {
  type ="string"
  default ="sub_jing"
}
variable "subnet_cidr"{
  default = ""
}
