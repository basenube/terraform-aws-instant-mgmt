variable "isc_key" {
  description = "This is the stack identifier through out the resources created."
  default = "ISCMODULETEST"
}

# Used for the Bastion
variable "keypair" {
  default = "ISC-508633890703-key-pair"
}

variable "aws_region" {
  description = "Region for the ISC VPC"
  default = "us-east-1"
}
