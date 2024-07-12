##################################################################################
# IAM USER RESOURCE
##################################################################################

#configured aws provider with proper credentials
resource "aws_iam_user" "elvis-prod" {
  name = "elvis-prod"

  tags = {
    name = "elvis-prod"
  }
}

#give the iam user programatic access
resource "aws_iam_access_key" "aws_iam_access_key" {
  user = aws_iam_user.elvis-prod.name
}

#create the inline policy
data "aws_iam_policy_document" "s3_get_put_delete_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::deprotech/*",
      "arn:aws:s3:::deprotechelvis/*"
    ]
  }
}

#attach the policy to the user
resource "aws_iam_user_policy" "s3_get_put_delete_policy" {
  name   = "s3_get_put_delete_policy"
  user   = aws_iam_user.elvis-prod.name
  policy = data.aws_iam_policy_document.s3_get_put_delete_document.json
}