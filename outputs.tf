output "aws_ecr_repository" {
  value = "${aws_ecr_repository.this.repository_url}"
}

output "aws_ecr_repository_name" {
  value = "${aws_ecr_repository.this.name}"
}

output "aws_ecr_repository_arn" {
  value = "${aws_ecr_repository.this.arn}"
}

output "aws_ecr_image" {
  value = "${aws_ecr_repository.this.repository_url}:${var.ecr_image_tag}"
}
