data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

#perhaps only trust policy will be needed

data "aws_iam_policy_document" "kubeguard-instance-profile-policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::aws-ssm-region/*",
      "arn:aws:s3:::amazon-ssm-region/*",
      "arn:aws:s3:::amazon-ssm-packages-region/*",
      "arn:aws:s3:::*",
      "arn:aws:s3:::*",
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values = [
        "",
        "home/",
        "home/&{aws:username}/",
      ]
    }
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}",
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}/*",
    ]
  }
}