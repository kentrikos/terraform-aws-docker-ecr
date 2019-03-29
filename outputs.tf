output "aws_ecr_repository" {
  value = "${aws_ecr_repository.this.repository_url}"
}

output "aws_ecr_image" {
  value = "${aws_ecr_repository.this.repository_url}:${var.ecr_image_tag}"
}
