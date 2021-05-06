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

resource "github_repository" "my_public_repo" {
  name        = "public-visibility"
  description = "A public-visible repository created by Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "my_private_repo" {
  name        = "private-visibility"
  description = "A private-visible repository automatically created by Terraform"
  visibility  = "private"
  auto_init   = true
}

output "public_repository_clone_url" {
  description = "public repo clone url"
  value       = github_repository.my_public_repo.git_clone_url
}

output "private_repository_fullname" {
  description = "private repo clone url"
  value       = github_repository.my_private_repo.full_name
}





# resource "github_branch" "public_development" {
#   repository = github_repository.my_public_repo.name
#   branch     = "development"
# }

# resource "github_branch" "public_staging" {
#   repository = github_repository.my_public_repo.name
#   branch     = "staging"
# }

# resource "github_branch_default" "public_default_branch" {
#   repository = github_repository.my_public_repo.name
#   branch     = github_branch.public_development.branch
# }

# resource "github_branch" "private_development" {
#   repository = github_repository.my_private_repo.name
#   branch     = "development"
# }

# resource "github_branch" "private_staging" {
#   repository = github_repository.my_private_repo.name
#   branch     = "staging"
# }

# resource "github_branch_default" "private_default_branch" {
#   repository = github_repository.my_private_repo.name
#   branch     = github_branch.private_staging.branch
# }

# resource "github_branch_protection_v3" "public_protect_development_branch" {
#   repository     = github_repository.my_public_repo.name
#   branch         = github_branch.public_development.branch
#   enforce_admins = true

#   required_pull_request_reviews {
#     required_approving_review_count = 2
#   }
# }
