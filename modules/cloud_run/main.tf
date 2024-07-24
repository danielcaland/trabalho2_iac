resource "google_cloud_run_v2_service" "service" {
  name     = var.cloud_run_service_name
  location = var.location
  ingress  = var.ingress

  template {
    scaling {
      min_instance_count = 1
      max_instance_count = 5

    }
    volumes {
      name = "cloudsql"
      cloud_sql_instance {
        instances = [var.cloud_sql_instance_connection]
      }
    }
    containers {
      image = var.container_image_url
      ports {
        container_port = var.container_port
      }
      resources {
        limits = {
          cpu    = var.cpu_limit
          memory = var.memory_limit
        }
        startup_cpu_boost = true
        cpu_idle          = false # https://stackoverflow.com/questions/74117558/how-to-activate-cpu-is-always-allocated-in-a-cloud-run-deployment-with-terrafo
      }
      # Startup probe configuration
      startup_probe {
        tcp_socket {
          port = var.container_port
        }
        period_seconds        = var.period_seconds
        initial_delay_seconds = var.initial_delay_seconds
        timeout_seconds       = var.timeout_seconds
        failure_threshold     = var.failure_threshold
      }
      env {
        name  = "WORDPRESS_DB_HOST"
        value = ":/cloudsql/${var.cloud_sql_instance_connection}"
      }
      env {
        name  = "WORDPRESS_DB_USER"
        value = var.db_user
      }
      env {
        name  = "WORDPRESS_DB_PASSWORD"
        value = var.db_password
      }
      env {
        name  = "WORDPRESS_DB_NAME"
        value = var.db_name
      }
      env {
        name  = "WORDPRESS_TABLE_PREFIX"
        value = var.db_table_prefix
      }
    }
  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = var.percent
  }
  #metadata {
  #  annotations = {
  #    "run.googleapis.com/cloudsql-instances" = var.cloud_sql_instance_connection
  #    "run.googleapis.com/startup-cpu-boost"  = var.startup-cpu-boost
  #  }
  #}
}

resource "google_cloud_run_v2_service_iam_member" "member" {
  location = var.location
  project  = var.project_id
  name     = google_cloud_run_v2_service.service.name
  role     = var.role
  member   = var.member

  depends_on = [google_cloud_run_v2_service.service]
}

# resource "google_cloud_run_v2_service_iam_member" "member" {
#   project = google_cloud_run_v2_service.default.project
#   location = google_cloud_run_v2_service.default.location
#   name = google_cloud_run_v2_service.default.name
#   role = "roles/viewer"
#   member = "user:jane@example.com"
# }