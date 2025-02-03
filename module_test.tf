module "vpc" {
  source = "./aws/vpc"
  name = "1"
  cidr_block = "10.1.0.0/16"
}
module "subnet1" {
  source = "./aws/subnet"
  name = "1"
  vpc_id = module.vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-northeast-2a"
}
module "route_table" {
  source = "./aws/route_table"
  vpc_id = module.vpc.vpc_id
  name = "1"
  subnet_id = module.subnet1.subnet_id
}
module "igw" {
  source = "./aws/igw"
  name = "igw"
  vpc_id = module.vpc.id
  route_table_id = module.route_table.id
}