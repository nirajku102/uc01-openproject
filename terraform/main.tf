provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id              = module.network.vpc_id
  public_subnet_id    = module.network.public_subnet_id
  key_name            = var.key_name
  instance_type       = var.instance_type
  ami_id              = var.ami_id
  security_group_ids  = [module.alb.ec2_sg_id]
  user_data_script    = file("scripts/openproject.sh")
}

module "alb" {
  source = "./modules/alb"

  vpc_id           = module.network.vpc_id
  public_subnets   = module.network.public_subnets
  ec2_instance_id  = module.ec2.instance_id
}
