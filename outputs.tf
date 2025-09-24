# Outputs for the EC2 instances using Count

# output "ec2_public_ip" {
#   description = "The public IP of the My Terra Automate EC2 instance"
#   value       = aws_instance.my_instance[*].public_ip
  
# }
# output "ec2_public_dns" {
#   description = "The DNS of the My Terra Automate EC2 instance"
#   value       = aws_instance.my_instance[*].public_dns
# }

# output "ec2_private_ip" {
#   description = "The private IP of the My Terra Automate EC2 instance"
#   value       = aws_instance.my_instance[*].private_ip
  
# }

# Outputs for the EC2 instances using for_each

output "ec2_public_ip" {
  description = "The public IP of the My Terra Automate EC2 instances"
  value       = { for k, instance in aws_instance.my_instance : k => instance.public_ip }
}

output "ec2_public_dns" {
  description = "The public DNS of the My Terra Automate EC2 instances"
  value       = { for k, instance in aws_instance.my_instance : k => instance.public_dns }
}

output "ec2_private_ip" {
  description = "The private IP of the My Terra Automate EC2 instances"
  value       = { for k, instance in aws_instance.my_instance : k => instance.private_ip }
}
