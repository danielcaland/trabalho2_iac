variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "service_name" {
  description = "Service Name for Load Balancer"
  type        = string
}

variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "load_balancing_scheme" {
  description = "Indicates whether the backend service will be used with internal or external load balancing"
  type        = string
}

variable "protocol" {
  description = "The protocol this BackendService uses to communicate with backends."
  type        = string
}

variable "network_endpoint_type" {
  description = "Type of network endpoints in this network endpoint group"
  type        = string
}

variable "port_range" {
  description = "Port range of the load balancer forwarding rule"
  type        = number
}

variable "ip_load_balancer_description" {
  description = "IP Address of the Load Balancer"
  type        = string
}  