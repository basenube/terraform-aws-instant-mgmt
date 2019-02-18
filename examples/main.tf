// This example launches resources in the VPC created from the module.
// 

// AWS Provider
provider "aws" {
  region = "${var.aws_region}"
}

// Include the ISC VPC Module
module "isc-mgmt" {
  source = "../"
  isc_key = "ISCRON"
}

