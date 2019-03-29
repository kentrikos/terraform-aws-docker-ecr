# terraform-aws-eks

A terraform module to create an AWS ECR repository and populate it with a docker image built from a git repository.

## Assumptions
* AWS CLI tool is installed in environment
* Docker is installed in environment
* Repository has a Dockerfile

## Usage example

```hcl
module "docker_ecr" {
    source          = "github.com/greermichael/terraform-aws-docker-ecr"
    repository_name = "my-repo"
    git_repo_url    = "https://github.com/mygit/mydockerbuild.git"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ecr_image_tag | Tag to apply to the built image | string | `latest` | no |
| git_repo_url | URL of the git repo to clone container the Docker image (Dockerfile must be in the root directory) | string | - | yes |
| repository_name | Name of the ECR repository to create | string | - | yes |
| working_dir | Working directory for git clone and docker build operations. (Must end with '/') | string | `./tmp/` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws_ecr_image | - |
| aws_ecr_repository | - |