output "repository_clone_url" {
  description = "The repository clone url"
  value       = github_repository.new_repo.git_clone_url
}
