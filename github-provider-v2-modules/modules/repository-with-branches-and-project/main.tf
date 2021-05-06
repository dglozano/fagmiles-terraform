resource "github_repository" "new_repo" {
  name         = var.repo_name
  description  = var.repo_description
  visibility   = var.repo_visibility
  has_projects = true
  auto_init    = true
}

resource "github_branch" "develop" {
  repository = github_repository.new_repo.name
  branch     = "development"
}

resource "github_branch" "staging" {
  repository = github_repository.new_repo.name
  branch     = "staging"
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.new_repo.name
  branch     = github_branch.develop.branch
}

resource "github_repository_project" "project" {
  name       = "Awesome project"
  repository = github_repository.new_repo.name
  body       = "This is a project."
}
