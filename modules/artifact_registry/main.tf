resource "google_artifact_registry_repository" "docker_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  format        = var.format
}

resource "null_resource" "docker_commands" {
  provisioner "local-exec" {
    #gcloud auth login
    #gcloud auth print-access-token
    #podman login -u oauth2accesstoken -p "$(gcloud auth print-access-token)" https://us-central1-docker.pkg.dev
    command = <<EOT
      podman pull docker.io/wordpress
      podman tag wordpress ${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}/${var.image_name}:1.0.0
      podman push ${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}/${var.image_name}:1.0.0
    EOT
  }
}