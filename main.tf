provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "artifact_registry" {
  source        = "./modules/artifact_registry"
  project_id    = var.project_id
  repository_id = var.repository_id
  location      = var.region
  format        = var.format
  region        = var.region
  image_name    = var.image_name
  nome_da_imagem_docker_hub = var.nome_da_imagem_docker_hub
}

module "cloud_sql" {
  source                                        = "./modules/cloud_sql"
  instance_name                                 = var.instance_name
  project_id                                    = var.project_id
  region                                        = var.region
  db_password                                   = var.db_password
  database_version                              = var.database_version
  db_name                                       = var.db_name
  db_tier                                       = var.db_tier
  availability_type                             = var.availability_type
  disk_autoresize                               = var.disk_autoresize
  disk_size                                     = var.disk_size
  ipv4_enabled                                  = var.ipv4_enabled
  db_user                                       = var.db_user
  enable_private_path_for_google_cloud_services = var.enable_private_path_for_google_cloud_services
  google_compute_network_name                   = var.google_compute_network_name
  google_compute_global_address_name            = var.google_compute_global_address_name
  google_compute_global_address_purpose         = var.google_compute_global_address_purpose
  google_compute_global_address_address_type    = var.google_compute_global_address_address_type
  google_compute_global_address_prefix_length   = var.google_compute_global_address_prefix_length
  google_service_networking_connection_service  = var.google_service_networking_connection_service
  google_sql_user_host                          = var.google_sql_user_host
  deletion_protection = var.deletion_protection
}

module "cloud_run" {
  source                        = "./modules/cloud_run"
  project_id                    = var.project_id
  location                      = var.region
  cloud_run_service_name        = var.cloud_run_service_name
  container_image_url           = module.artifact_registry.image_url
  cloud_sql_instance_connection = module.cloud_sql.connection_name_cloud_sql
  db_user                       = var.db_user
  db_password                   = var.db_password
  db_name                       = var.db_name
  db_table_prefix               = var.db_table_prefix
  container_port                = var.container_port
  period_seconds                = var.period_seconds
  initial_delay_seconds         = var.initial_delay_seconds
  timeout_seconds               = var.timeout_seconds
  failure_threshold             = var.failure_threshold
  startup-cpu-boost             = var.startup-cpu-boost
  percent                       = var.percent
  cpu_limit                     = var.cpu_limit
  memory_limit                  = var.memory_limit
  role                          = var.role
  member                        = var.member
  type                          = var.type
  ingress                       = var.ingress
  volume_cloudsql = var.volume_cloudsql
  startup_cpu_boost = var.startup_cpu_boost
  cpu_idle = var.cpu_idle 
  WORDPRESS_DB_HOST = var.WORDPRESS_DB_HOST 
  WORDPRESS_DB_USER = var.WORDPRESS_DB_USER 
  WORDPRESS_DB_PASSWORD = var.WORDPRESS_DB_PASSWORD 
  WORDPRESS_DB_NAME = var.WORDPRESS_DB_NAME 
  WORDPRESS_TABLE_PREFIX = var.WORDPRESS_TABLE_PREFIX
  TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST = var.TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST
  
  depends_on                    = [module.cloud_sql]
}

module "load_balancer" {
  source                 = "./modules/load_balancer"
  project_id             = var.project_id
  region                 = var.region
  cloud_run_service_name = module.cloud_run.cloud_run_service_name
  service_name           = var.service_name
  network_endpoint_type  = var.network_endpoint_type
  load_balancing_scheme  = var.load_balancing_scheme
  protocol               = var.protocol
  port_range             = var.port_range
  ip_load_balancer_description = var.ip_load_balancer_description

  depends_on = [module.cloud_run]
}