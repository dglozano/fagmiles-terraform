# Ref.: https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}

# data "docker_registry_image" "nginx_information" {
#   name = "nginx:latest"
# }

# output "nginx_sha256" {
#   value = data.docker_registry_image.nginx_information.sha256_digest
# }
