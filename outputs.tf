output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The name of the VPC being created"
}

output "subnet_name" {
  value       = module.vpc.subnet_name
  description = "The name of the subnet being created"
}

output "nat_name" {
  value       = module.nat.nat_name
  description = "The name of the Cloud NAT"
}