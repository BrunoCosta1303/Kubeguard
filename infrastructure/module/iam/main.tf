resource "aws_iam_role" "kubeguard-instance-profile-role" {
  
}

#! https://www.pluralsight.com/cloud-guru/labs/aws/creating-an-ssm-iam-role-and-configuring-an-ec2-instance-with-aws-systems-manager-via-the-cli

resource "aws_iam_role" "ssm-instance-profile" {
 name = "kubeguard-ssm-instance-profile-role"

 path = "/"

 assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

#! https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
resource "aws_iam_policy" "example" {
  name   = "example_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.example.json
}