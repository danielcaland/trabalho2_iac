resource "google_sql_database_instance" "db_instance" {
  name                = var.instance_name
  project             = var.project_id
  region              = var.region
  database_version    = var.database_version
  deletion_protection = "false"


  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier              = var.db_tier
    availability_type = var.availability_type
    disk_autoresize   = var.disk_autoresize
    disk_size         = var.disk_size
    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = google_compute_network.private_network.id
      enable_private_path_for_google_cloud_services = var.enable_private_path_for_google_cloud_services
    }
  }
}

resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.db_instance.name
  password = var.db_password
  host     = var.google_sql_user_host
}

resource "google_sql_database" "db" {
  name     = var.db_name
  instance = google_sql_database_instance.db_instance.name
  project  = var.project_id

}

resource "google_compute_network" "private_network" {

  name = var.google_compute_network_name
}

resource "google_compute_global_address" "private_ip_address" {

  name          = var.google_compute_global_address_name
  purpose       = var.google_compute_global_address_purpose
  address_type  = var.google_compute_global_address_address_type
  prefix_length = var.google_compute_global_address_prefix_length
  network       = google_compute_network.private_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {

  network                 = google_compute_network.private_network.id
  service                 = var.google_service_networking_connection_service
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}