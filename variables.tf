variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "ami-id" {
  type    = string
  default = "ami-018a1ea25ff5268f0"
}

variable "jenkins-s3-bucket" {
  type    = string
  default = "luit-project-terraform"
}

variable "subnet_id" {
  type    = string
  default = "subnet-05dddfd75edf2b773"
}