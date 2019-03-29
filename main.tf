data "aws_region" "current" {}

resource "aws_ecr_repository" "this" {
  name = "${var.repository_name}"
}

resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/git.sh ${var.git_repo_url} \"${var.working_dir}\" "
  }
}

resource "null_resource" "docker_build" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/docker.sh \"${var.working_dir}\" ${aws_ecr_repository.this.repository_url} ${data.aws_region.current.name} ${var.ecr_image_tag}"
  }

  depends_on = ["null_resource.git_clone"]
}

resource "null_resource" "clean_up" {
  provisioner "local-exec" {
    command = "rm -rf \"${var.working_dir}\""
  }

  depends_on = ["null_resource.docker_build"]
}
