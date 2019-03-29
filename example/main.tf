provider "aws" {
  profile = "cd-test-transit"
  region  = "us-east-1"
}

module "docker" {
  source = "../"

  repository_name = "docker-fluentd-es"
  git_repo_url    = "https://github.com/greermichael/fluentd-aws-elasticsearch.git"
}

output "aws_ecr_repository" {
  value = "${module.docker.aws_ecr_repository}"
}

output "aws_ecr_image" {
  value = "${module.docker.aws_ecr_image}"
}
