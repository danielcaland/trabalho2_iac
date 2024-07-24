resource "google_compute_global_address" "default" {
  name    = "${var.service_name}-ip"
  project = var.project_id
}

resource "google_compute_url_map" "default" {
  name            = "${var.service_name}"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_backend_service" "default" {
  name                  = "be-${var.service_name}"
  load_balancing_scheme = var.load_balancing_scheme
  protocol              = var.protocol

  backend {
    group = google_compute_region_network_endpoint_group.default.self_link
  }
}

resource "google_compute_region_network_endpoint_group" "default" {
  name                  = "${var.service_name}-neg"
  region                = var.region
  network_endpoint_type = var.network_endpoint_type

  cloud_run {
    service = var.cloud_run_service_name
  }
}

resource "google_compute_target_http_proxy" "default" {
  name    = "${var.service_name}-http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "fe-${var.service_name}"
  target                = google_compute_target_http_proxy.default.self_link
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  ip_address            = google_compute_global_address.default.address
}

resource "null_resource" "wait_for_health_check" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Aguardando load balancer reconhecer serviço do Cloud Run..."
      sleep 300
    EOT
  }

  depends_on = [
    google_compute_global_address.default,
    google_compute_url_map.default,
    google_compute_backend_service.default,
    google_compute_region_network_endpoint_group.default,
    google_compute_target_http_proxy.default,
    google_compute_global_forwarding_rule.default
  ]
}