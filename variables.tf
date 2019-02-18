variable "basenube_key" {
  description = "This is the stack identifier through out the resources created."
  // default = "basenube"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed with this plan."
  type        = "map"

  default = {
    TerraformDeveloper  = "Ron Sweeney"
    Department = "Full Stack Architecture"
  }
}

variable "emails" {
  type = "list"
  default = ["ron@basenube.com", "ron@provider.share"]
}



