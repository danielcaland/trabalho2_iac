output "ip_address" {
  description = "IP Address of the Load Balancer"
  value       = google_compute_global_address.default.address
}