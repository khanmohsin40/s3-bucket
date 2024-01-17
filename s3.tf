resource "aws_s3_bucket" "s3-bucket-prod" {

    bucket = "s3-bucket-prod"
  
}
/*#ACL*/
resource "aws_s3_bucket_acl" "s3-bucket-acl" {

    bucket = aws_s3_bucket.s3-bucket-prod.id
  acl = "private"
}
/*versioning*/
resource "aws_s3_bucket_versioning" "s3-bucket-ver" {

    bucket = aws_s3_bucket.s3-bucket-prod.id
versioning_configuration {
  
  status = "Enabled"
}
  
}