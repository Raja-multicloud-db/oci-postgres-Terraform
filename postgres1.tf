resource "google_sql_database_instance" "postgres" {
  name             = var.db_instance_name
  database_version = "POSTGRES_16"
  region           = var.region

  deletion_protection = false

  settings {
    tier              = var.db_tier
    availability_type = "ZONAL"

    disk_type = "PD_SSD"
    disk_size = 10

    disk_autoresize = true

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled = false

      private_network = google_compute_network.postgres_vpc.id

      enable_private_path_for_google_cloud_services = true
    }

    maintenance_window {
      day          = 7
      hour         = 2
      update_track = "stable"
    }
  }

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]
}

resource "google_sql_database" "app_database" {
  name     = var.db_name
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "postgres_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
