resource "aws_s3_bucket" "docker-images" {
  bucket = "${var.environment}-docker-images"
  acl = "private"
  
  tags {
    Name = "${var.environment}-docker-images"
  }

}

resource "aws_s3_bucket" "docker-registry-conf" {
  bucket = "${var.environment}-docker-registry-conf"
  acl = "private"
  
  tags {
    Name = "${var.environment}-docker-registry-conf"
  }

}
