resource "google_compute_network" "postgres_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false

  depends_on = [
    google_project_service.required_services
  ]
}

resource "google_compute_subnetwork" "postgres_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.postgres_vpc.id
}

resource "google_compute_global_address" "private_ip_range" {
  name          = var.private_ip_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.private_ip_prefix_length

  network = google_compute_network.postgres_vpc.id

  depends_on = [
    google_project_service.required_services
  ]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network = google_compute_network.postgres_vpc.id

  service = "servicenetworking.googleapis.com"

  reserved_peering_ranges = [
    google_compute_global_address.private_ip_range.name
  ]

  depends_on = [
    google_project_service.required_services
  ]
}

resource "google_compute_network_peering_routes_config" "private_service_routes" {
  peering = google_service_networking_connection.private_vpc_connection.peering

  network = google_compute_network.postgres_vpc.name

  import_custom_routes = true
  export_custom_routes = true

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]
}
