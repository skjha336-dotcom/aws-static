module "networkModule" {
  source                      = "./modules/network"
  region                      = var.region
  environment_tag             = var.environment_tag
  cidr_block_range            = var.cidr_block_range
  subnet1_cidr_block_range    = var.subnet1_cidr_block_range
  subnet2_cidr_block_range    = var.subnet2_cidr_block_range
  availability_zone           = var.availability_zone
  public_key_path             = var.public_key_path
}

module "securityGroupModule" {
  source          = "./modules/securityGroup"
  region          = var.region
  vpc_id          = module.networkModule.vpc_id
  environment_tag = var.environment_tag
}

module "instanceModule" {
  source             = "./modules/instance"
  region             = var.region
  vpc_id             = module.networkModule.vpc_id
  subnet_public_id   = module.networkModule.public_subnets[0]
  key_pair_name      = module.networkModule.ec2keyName
  security_group_ids = [module.securityGroupModule.sg_22, module.securityGroupModule.sg_80]
  environment_tag    = var.environment_tag
}

module "dnsModule" {
  source      = "./modules/dns"
  region      = var.region
  domain_name = var.domain_name

  aRecords = [
    format("%s %s", var.domain_name, module.instanceModule.instance_eip)
  ]

  cnameRecords = [
    format("www.%s %s", var.domain_name, var.domain_name)
  ]
}
