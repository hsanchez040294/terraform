data "template_file" "public_cidrsubnet" {
    count = var.vpc_subnet_count
    // 3
    template = "$${cidrsubnet(vpc_cidr,8,current_count)}"
    //public_subnets = [ "10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24" ]
    vars = {
      vpc_cidr = var.network_cid_vpc
      current_count = count.index
    }
  
}

data "template_file" "private_cidrsubnet" {
    count = var.vpc_subnet_count
    // 3
    template = "$${cidrsubnet(vpc_cidr,8,current_count)}"
    //private_subnets = [ "10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
    vars = {
      vpc_cidr = var.network_cid_vpc
      current_count = count.index + 10
    }
}