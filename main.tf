provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source      = "./modules/vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

module "nat" {
  source     = "./modules/nat"
  project_id = var.project_id
  region     = var.region
  vpc_name   = module.vpc.vpc_name
}

variable "project_id" {}
variable "region" {}
variable "subnet_cidr" {}