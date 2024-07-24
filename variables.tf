variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "uece-infra-as-code"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "service_name" {
  description = "Service Name for Load Balancer"
  type        = string
  default     = "lb-wp-terraform"
}

variable "load_balancing_scheme" {
  description = "Indicates whether the backend service will be used with internal or external load balancing"
  type        = string
  default     = "EXTERNAL_MANAGED"
}

variable "protocol" {
  description = "The protocol this BackendService uses to communicate with backends."
  type        = string
  default     = "HTTPS"
}

variable "network_endpoint_type" {
  description = "Type of network endpoints in this network endpoint group"
  type        = string
  default     = "SERVERLESS"
}

variable "port_range" {
  description = "Port range of the load balancer forwarding rule"
  type        = number
  default     = 80
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database Name"
  type        = string
  sensitive   = true
}

variable "google_sql_user_host" {
  description = "Database google_sql_user_host"
  type        = string
  default     = "%"
}

variable "instance_name" {
  description = "GCP cloud sql instance_name"
  type        = string
  default     = "mysql-database-terraform-wordpress-db"
}

variable "database_version" {
  description = "GCP cloud sql database_version"
  type        = string
  default     = "MYSQL_8_0"
}

variable "db_tier" {
  description = "GCP cloud sql database tier"
  type        = string
  default     = "db-n1-standard-1"
  #default     = "db-f1-micro"
}

variable "availability_type" {
  description = "GCP cloud sql availability_type"
  type        = string
  default     = "ZONAL"
}

variable "disk_autoresize" {
  description = "GCP cloud sql disk_autoresize"
  type        = bool
  default     = true
}

variable "disk_size" {
  description = "GCP cloud sql disk_size"
  type        = number
  default     = 10
}

variable "location" {
  description = "GCP Region/Location"
  type        = string
  default     = "us-central1"
}

variable "cloud_run_service_name" {
  description = "Cloud Run Service Name"
  type        = string
  default     = "wp-terraform"
}

variable "db_user" {
  description = "Database User"
  type        = string
  sensitive   = true
}

variable "db_table_prefix" {
  description = "Database table prefix"
  type        = string
  sensitive   = true
}

variable "container_port" {
  description = "Containter port"
  type        = number
  default     = 80
}

variable "cpu_limit" {
  description = "Container cpu limit"
  type        = number
  default     = 1
}

variable "memory_limit" {
  description = "Container memory limit"
  type        = string
  default     = "512Mi"
}

variable "period_seconds" {
  description = "startup probe period seconds"
  type        = number
  default     = 240
}

variable "initial_delay_seconds" {
  description = "Database table prefix"
  type        = number
  default     = 0
}

variable "timeout_seconds" {
  description = "startup probe timeout_seconds"
  type        = number
  default     = 240
}

variable "failure_threshold" {
  description = "startup probe failure_threshold"
  type        = number
  default     = 1
}

variable "percent" {
  description = "traffic percent"
  type        = number
  default     = 100
}

variable "startup-cpu-boost" {
  description = "startup-cpu-boost"
  type        = bool
  default     = true
}

variable "format" {
  description = "The format of packages that are stored in the repository"
  type        = string
  default     = "DOCKER"
}

variable "repository_id" {
  description = "Repository ID"
  type        = string
  default     = "repositorio-wordpress-app-terraform"
}

variable "image_name" {
  description = "Image location"
  type        = string
  default     = "wp"
}

variable "ipv4_enabled" {
  description = "Enable or disable Ipv4"
  type        = bool
  default     = true
}

variable "enable_private_path_for_google_cloud_services" {
  description = "enable_private_path_for_google_cloud_services"
  type        = bool
  default     = true
}

variable "google_compute_network_name" {
  description = "google_compute_network_name"
  type        = string
  default     = "private-network"
}

variable "google_compute_global_address_name" {
  description = "google_compute_global_address_name"
  type        = string
  default     = "private-ip-address"
}

variable "google_compute_global_address_purpose" {
  description = "google_compute_global_address_purpose"
  type        = string
  default     = "VPC_PEERING"
}

variable "google_compute_global_address_address_type" {
  description = "google_compute_global_address_address_type"
  type        = string
  default     = "INTERNAL"
}

variable "google_compute_global_address_prefix_length" {
  description = "google_compute_global_address_prefix_length"
  type        = number
  default     = 16
}

variable "google_service_networking_connection_service" {
  description = "google_service_networking_connection_service"
  type        = string
  default     = "servicenetworking.googleapis.com"
}

variable "role" {
  description = "Cloud run role IAM"
  type        = string
  default     = "roles/run.invoker"
}

variable "member" {
  description = "Cloud run member IAM"
  type        = string
  default     = "allUsers"
}

variable "type" {
  description = "The allocation type for the cloud run service traffic target"
  type        = string
  default     = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
}

variable "ingress" {
  description = "Provides the ingress settings for the Cloud run service"
  type        = string
  default     = "INGRESS_TRAFFIC_ALL"
}  

variable "nome_da_imagem_docker_hub" {
  description = "Nome da imagem a ser feito o pull do docker hub"
  type        = string
  default     = "wordpress"
}   

variable "volume_cloudsql" {
  description = "Nome do volume para o cloudsql"
  type        = string
  default     = "cloudsql"
}  

variable "startup_cpu_boost" {
  description = "startup_cpu_boost do cloud run"
  type        = bool
  default     = true
}  

variable "cpu_idle" {
  description = "Configuracao CPU is always allocated do servico do cloud run"
  type        = bool
  default     = false
}  

variable "WORDPRESS_DB_HOST" {
  description = "WORDPRESS_DB_HOST env"
  type        = string
  default     = "WORDPRESS_DB_HOST"
}  

variable "WORDPRESS_DB_USER" {
  description = "WORDPRESS_DB_USER env"
  type        = string
  default     = "WORDPRESS_DB_USER"
}  

variable "WORDPRESS_DB_PASSWORD" {
  description = "WORDPRESS_DB_PASSWORD env"
  type        = string
  default     = "WORDPRESS_DB_PASSWORD"
}  

variable "WORDPRESS_DB_NAME" {
  description = "WORDPRESS_DB_NAME env"
  type        = string
  default     = "WORDPRESS_DB_NAME"
}  

variable "WORDPRESS_TABLE_PREFIX" {
  description = "WORDPRESS_TABLE_PREFIX env"
  type        = string
  default     = "WORDPRESS_TABLE_PREFIX"
}  

variable "ip_load_balancer_description" {
  description = "IP Address of the Load Balancer"
  type        = string
  default     = "IP Address of the Load Balancer"
}  

variable "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST" {
  description = "config para setar o servico do cloud run para a ultima versao"
  type        = string
  default     = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
}  

variable "deletion_protection" {
  description = "Cloud sql deletion_protection"
  type        = bool
  default     = false
}  



