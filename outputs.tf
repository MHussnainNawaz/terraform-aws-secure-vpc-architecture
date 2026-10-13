output "vpc_id" {
  description = "Generated VPC ID"
  value       = aws_vpc.main.id
}

output "nat_gateway_ip" {
  description = "Public IP of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Jump Host"
  value       = aws_instance.bastion.public_ip
}

output "private_workload_private_ip" {
  description = "Internal IP of the Backend Private Instance"
  value       = aws_instance.private_workload.private_ip
}