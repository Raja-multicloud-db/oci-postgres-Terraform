variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "asia-south1-a"
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "postgres-vpc"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "postgres-subnet"
}

variable "subnet_cidr" {
  description = "Subnet CIDR range"
  type        = string
  default     = "10.10.0.0/24"
}

variable "private_ip_name" {
  description = "Private IP range name for Cloud SQL"
  type        = string
  default     = "postgres-private-ip"
}

variable "private_ip_prefix_length" {
  description = "Prefix length for private service networking"
  type        = number
  default     = 16
}

variable "db_instance_name" {
  description = "Cloud SQL PostgreSQL instance name"
  type        = string
  default     = "postgres-instance"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "appdb"
}

variable "db_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "postgresadmin"
}

variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "db_tier" {
  description = "Cloud SQL machine tier"
  type        = string
  default     = "db-f1-micro"
}
