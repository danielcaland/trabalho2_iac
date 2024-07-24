output "cloud_run_url" {
  description = "URL of the deployed Cloud Run service"
  value       = google_cloud_run_v2_service.service.uri
}

output "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
  value       = google_cloud_run_v2_service.service.name
}