variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "location" {
  description = "GCP Region/Location"
  type        = string
}

variable "cloud_run_service_name" {
  description = "Cloud Run Service Name"
  type        = string
}

variable "cloud_sql_instance_connection" {
  description = "Cloud SQL Instance Connection Name"
  type        = string
}

variable "db_user" {
  description = "Database User"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "db_table_prefix" {
  description = "Database table prefix"
  type        = string
}

variable "container_port" {
  description = "Containter port"
  type        = number
}

variable "cpu_limit" {
  description = "Container cpu limit"
  type        = number
}

variable "memory_limit" {
  description = "Container memory limit"
  type        = string
}

variable "period_seconds" {
  description = "startup probe period seconds"
  type        = number
}

variable "initial_delay_seconds" {
  description = "Database table prefix"
  type        = number
}

variable "timeout_seconds" {
  description = "startup probe timeout_seconds"
  type        = number
}

variable "failure_threshold" {
  description = "startup probe failure_threshold"
  type        = number
}

variable "percent" {
  description = "traffic percent"
  type        = number
}

variable "startup-cpu-boost" {
  description = "startup-cpu-boost"
  type        = bool
}

variable "container_image_url" {
  description = "artifact_registry_image_url"
  type        = string
}

variable "role" {
  description = "Cloud run role IAM"
  type        = string
}

variable "member" {
  description = "Cloud run member IAM"
  type        = string
}

variable "type" {
  description = "The allocation type for the cloud run service traffic target"
  type        = string
}

variable "ingress" {
  description = "Provides the ingress settings for the Cloud run service"
  type        = string
}

variable "volume_cloudsql" {
  description = "Nome do volume para o cloudsql"
  type        = string
}  

variable "startup_cpu_boost" {
  description = "startup_cpu_boost do cloud run"
  type        = bool
}  

variable "cpu_idle" {
  description = "Configuracao CPU is always allocated do servico do cloud run"
  type        = bool
}  

variable "WORDPRESS_DB_HOST" {
  description = "WORDPRESS_DB_HOST env"
  type        = string
}  

variable "WORDPRESS_DB_USER" {
  description = "WORDPRESS_DB_USER env"
  type        = string
}  

variable "WORDPRESS_DB_PASSWORD" {
  description = "WORDPRESS_DB_PASSWORD env"
  type        = string
}  

variable "WORDPRESS_DB_NAME" {
  description = "WORDPRESS_DB_NAME env"
  type        = string
}  

variable "WORDPRESS_TABLE_PREFIX" {
  description = "WORDPRESS_TABLE_PREFIX env"
  type        = string
}  

variable "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST" {
  description = "config para setar o servico do cloud run para a ultima versao"
  type        = string
}