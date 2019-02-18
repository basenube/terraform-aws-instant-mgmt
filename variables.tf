variable "isc_key" {
  description = "This is the stack identifier through out the resources created."
  // default = "ISC"
}

variable "aws_region" {
  description = "Region for the ISC VPC"
  default = "us-east-1"
}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed with this plan."
  type        = "map"

  default = {
    Backup = "true"
    TerraformDeveloper  = "Graeme Durkee"
    Department = "Tech Services"
  }
}

variable "emails" {
  type = "list"
  default = ["ron@basenube.com", "Graeme.Durkee@intersystems.com"]
}



