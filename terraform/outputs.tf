output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_eip.app_eip.public_ip
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://${aws_eip.app_eip.public_ip}:8080"
} 