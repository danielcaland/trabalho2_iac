output "image_url" {
  description = "URL of the Docker image in Artifact Registry"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}/${var.image_name}:1.0.0"
}

output "image_name_output" {
  description = "Name of the Docker image in Artifact Registry"
  value       = var.image_name
}

output "repository_id_output" {
  description = "Repository name in Artifact Registry"
  value       = var.repository_id
}