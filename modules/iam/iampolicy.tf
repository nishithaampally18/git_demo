resource "aws_iam_user" "iam_user" {
  name = "nishitha_ampally" 

  tags = {
    Project    = "CLOD1003"
    Created_by = "Nishitha"   
  }
}

# data "aws_iam_user" "iam_user" {
#   user_name = "nishitha"
# }

resource "aws_iam_user_login_profile" "user_login_profile" {
  user    = aws_iam_user.iam_user.name
  password_reset_required = true
}


resource "aws_iam_policy" "policy" {
  name        = "s3_access_policy"
  path        = "/"
  description = "S3 Access policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": [var.resource]
        }
    ]
})
}

resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "nishitha-s3-attachment"
  users      = [aws_iam_user.iam_user.name] 
  policy_arn = aws_iam_policy.policy.arn
}