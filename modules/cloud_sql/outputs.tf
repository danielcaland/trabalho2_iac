output "connection_name_cloud_sql" {
  description = "Connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.db_instance.connection_name
}
