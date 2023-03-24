terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

data "aws_availability_zones" "available" {}

provider "aws" {
  profile = "hsanchez"
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  #name = "my-vpc"
  cidr = local.cidr_blocks
  name  = "globo-primary-${terraform.workspace}"
  azs            = slice(data.aws_availability_zones.available.names, 0, (local.subnet_count))
  //public_subnets = [for subnet in range(var.vpc_subnet_count) : cidrsubnet(var.network_cid_vpc, 8, subnet)]
  #public_subnets = var.public_subnets
  private_subnets = data.template_file.private_cidrsubnet.*.rendered
  public_subnets = data.template_file.public_cidrsubnet.*.rendered


  enable_nat_gateway   = false
  create_database_subnet_group = false

  locals =  {
      cidr_blocks = var.network_cid_vpc
      subnet_count = var.vpc_subnet_count

      common_tags =  {
        Environment = "Produccion"
        Team = "Networks"
    }
  }

    
  #tags = merge(local.common_tags, {
  #  Name = "${local.name_prefix}-${var.vpcnamebalancer}"
  #})
}