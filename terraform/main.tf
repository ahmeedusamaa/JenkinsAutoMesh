module "compute" {
  source = "./modules/compute"
  vpc_id = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids = module.networking.public_subnet_ids
  public_ec2_sg = module.security_group.public_ec2_sg_id
  private_ec2_sg = module.security_group.private_ec2_sg_id
  public_key = module.keypair.public_key
}

module "loadbalancer" {
  source = "./modules/LoadBalancer"
  vpc_id = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids = module.networking.public_subnet_ids
  lb_sg = module.security_group.lb_sg_id
  target_group_arn = module.compute.target_group_arn
}


module "networking" {
  source = "./modules/networking"
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs = var.azs
}

module "security_group" {
  source = "./modules/securitygroup"
  vpc_id = module.networking.vpc_id
  
}

module "keypair" {
  source = "./modules/keypair"
  public_key = var.public_key
}