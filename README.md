![gaze](https://www.basenube.com/archive/assets/images/basenube-github.png)

[![made-with-terraform](https://img.shields.io/badge/Made%20with-Terraform-1f425f.svg)](https://www.terraform.io/)  

# terraform-aws-instant-mgmt
## Terraform Module for Intstant Account Management Visibility

A Terraform module that gives you instant visibility to your account with alerting from AWS Config, Guard Duty, EC2, and Billing

## Resources Created

  This plan includes the creation of the following AWS Resources:

  -- Cloudwatch Event Rules: 3  
  -- Cloudwatch Event Targets: 3   
  -- SNS Topics: 4  
  -- Cloudwatch Metric Alarm: 1  

> Please note:  
> I used local-execs to subscribe to the topics as Terraform does not have the ability to do this as far as I can tell.

## Usage

```bash
# Include the Module
module "aws-instant-mgmt" {
  source = "github.com/basenube/terraform-aws-instant-mgmt"
  basenube_key = "basenube"
}
```

```bash
# Terraform shampoo
terraform init
terraform plan
terraform apply
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Author
Contains stolen gists glued together with Stack Overflow and HCL by Ron Sweeney <ron@basenube.com>

## License
[![License](https://img.shields.io/github/license/basenube/aws-instance-backup-ami-purge.svg?style=social)](https://github.com/basenube/aws-instance-backup-ami-purge)  
[MIT](https://choosealicense.com/licenses/mit/)
