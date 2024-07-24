variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "repository_id" {
  description = "Repository ID"
  type        = string
}

variable "location" {
  description = "Image location"
  type        = string
}

variable "format" {
  description = "The format of packages that are stored in the repository"
  type        = string
}

variable "image_name" {
  description = "Image location"
  type        = string
}

variable "nome_da_imagem_docker_hub" {
  description = "Nome da imagem a ser feito o pull do docker hub"
  type        = string
}  