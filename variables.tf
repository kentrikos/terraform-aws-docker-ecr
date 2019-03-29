variable "repository_name" {
  description = "Name of the ECR repository to create"
}

variable "working_dir" {
  description = "Working directory for git clone and docker build operations. (Must end with '/')"
  default     = "./tmp/"
}

variable "ecr_image_tag" {
  description = "Tag to apply to the built image"
  default     = "latest"
}

variable "git_repo_url" {
  description = "URL of the git repo to clone container the Docker image (Dockerfile must be in the root directory)"
}
