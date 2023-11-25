
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZHTYDPMGCGDRQKHG"
  secret_key = "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"
}
#s3 bucket

module "s3_bucket" {
  source = "./modules/s3"
}

#SG

module "security_group" {
  source = "./modules/sg"  
}

#EC2
module "ec2_instance" {
    depends_on = [module.security_group ]
    source = "./modules/ec2"
    ec2_instance = var.create_ec2_instance
    instance_count= var.instance_count
    security_group_id=  module.security_group.my_terraform_security

}

#IAM
module "iam" {
    depends_on = [module.s3_bucket]
    source = "./modules/iam"
    resource = module.s3_bucket.s3_arn
}

