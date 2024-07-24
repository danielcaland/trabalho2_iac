output "artifact_registry_url" {
  description = "URL of the Docker image in Artifact Registry"
  value       = module.artifact_registry.image_url
}

output "cloud_run_url" {
  description = "URL of the deployed Cloud Run service"
  value       = module.cloud_run.cloud_run_url
}

output "load_balancer_ip" {
  description = "IP Address of the Load Balancer"
  value       = module.load_balancer.ip_address
}