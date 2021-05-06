# Ref.: https://registry.terraform.io/providers/integrations/github/latest/docs
# Personal access tokens can be generated at https://github.com/settings/tokens

variable "owner" {
  description = "GitHub owner used to configure the provider"
  type        = string
}

variable "github_token" {
  description = "GitHub access token used to configure the provider"
  type        = string
}

provider "github" {
  owner = var.owner
  token = var.github_token
}

module "my_first_repo" {
  source = "./modules/repository-with-branches-and-project"

  repo_name        = "my_first_repo"
  repo_description = "This is my first repo created with Terraform"
}

module "my_second_repo" {
  source = "./modules/repository-with-branches-and-project"

  repo_name       = "my_second_repo"
  repo_visibility = "private"
}

output "my_first_repo_clone_url" {
  description = "First repo clone url"
  value       = module.my_first_repo.repository_clone_url
}

output "my_second_repo_clone_url" {
  description = "Second repo clone url"
  value       = module.my_second_repo.repository_clone_url
}
