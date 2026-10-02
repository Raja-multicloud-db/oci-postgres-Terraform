output "project_id" {
  description = "GCP project ID"
  value       = var.project_id
}

output "vpc_name" {
  description = "VPC network name"
  value       = google_compute_network.postgres_vpc.name
}

output "subnet_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.postgres_subnet.name
}

output "postgres_instance_name" {
  description = "Cloud SQL PostgreSQL instance name"
  value       = google_sql_database_instance.postgres.name
}

output "postgres_database_name" {
  description = "PostgreSQL database name"
  value       = google_sql_database.app_database.name
}

output "postgres_user" {
  description = "PostgreSQL username"
  value       = google_sql_user.postgres_user.name
}

output "postgres_private_ip" {
  description = "Private IP address of PostgreSQL instance"
  value       = google_sql_database_instance.postgres.private_ip_address
}

output "postgres_connection_name" {
  description = "Cloud SQL connection name"
  value       = google_sql_database_instance.postgres.connection_name
}
