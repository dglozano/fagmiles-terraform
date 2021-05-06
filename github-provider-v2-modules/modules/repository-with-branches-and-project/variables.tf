variable "repo_name" {
  description = "The repository name"
  type        = string
}

variable "repo_visibility" {
  description = "The repository visibility"
  default     = "public"
  type        = string
}

variable "repo_description" {
  description = "The repository description"
  default     = "Some repo"
  type        = string
}
