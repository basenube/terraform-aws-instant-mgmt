// This example launches resources in the VPC created from the module.
// 

// AWS Provider
provider "aws" {
  region = "${var.aws_region}"
}

// Include the basenube VPC Module
module "aws-instant-mgmt" {
  source = "github.com/basenube/terraform-aws-instant-mgmt"
  basenube_key = "basenube"
}

