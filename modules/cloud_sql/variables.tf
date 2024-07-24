variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
}

variable "db_user" {
  description = "Database User"
  type        = string
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "google_sql_user_host" {
  description = "Database google_sql_user_host"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "instance_name" {
  description = "GCP cloud sql instance_name"
  type        = string
}

variable "database_version" {
  description = "GCP cloud sql database_version"
  type        = string
}

variable "db_tier" {
  description = "GCP cloud sql database tier"
  type        = string
}

variable "availability_type" {
  description = "GCP cloud sql availability_type"
  type        = string
}

variable "disk_autoresize" {
  description = "GCP cloud sql disk_autoresize"
  type        = bool
}

variable "disk_size" {
  description = "GCP cloud sql disk_size"
  type        = number
}

variable "ipv4_enabled" {
  description = "Enable or disable Ipv4"
  type        = bool
}

variable "enable_private_path_for_google_cloud_services" {
  description = "enable_private_path_for_google_cloud_services"
  type        = bool
}

variable "google_compute_network_name" {
  description = "google_compute_network_name"
  type        = string
}

variable "google_compute_global_address_name" {
  description = "google_compute_global_address_name"
  type        = string
}

variable "google_compute_global_address_purpose" {
  description = "google_compute_global_address_purpose"
  type        = string
}

variable "google_compute_global_address_address_type" {
  description = "google_compute_global_address_address_type"
  type        = string
}

variable "google_compute_global_address_prefix_length" {
  description = "google_compute_global_address_prefix_length"
  type        = number
}

variable "google_service_networking_connection_service" {
  description = "google_service_networking_connection_service"
  type        = string
}

variable "deletion_protection" {
  description = "Cloud sql deletion_protection"
  type        = bool
}