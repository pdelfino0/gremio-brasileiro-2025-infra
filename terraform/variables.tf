variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0440d3b780d96b29d" # Amazon Linux 2023 AMI (us-east-1)
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "gremio-app-key"
}

variable "ssh_allowed_ips" {
  description = "List of IPs allowed to SSH into the EC2 instance"
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: For production, restrict to specific IPs
} 