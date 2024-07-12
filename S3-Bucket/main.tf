resource "aws_s3_bucket" "dev-bucket" {
  bucket = "dev-test-elvis"

  tags = var.common_tags
}