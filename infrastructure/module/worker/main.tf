#! https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_host
#! https://www.tderflinger.com/en/ec2-spot-with-terraform
resource "aws_ec2_host" "test" {
  provider = aws_master
  instance_type     = "c5.18xlarge"
  availability_zone = "us-west-2a"
  host_recovery     = "on"
  auto_placement    = "on"
}

# user_data = https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ssm/get-parameter.html

resource "aws_ec2_host" "test" {
  provider = aws_worker 
  instance_type     = "c5.18xlarge"
  availability_zone = "us-west-2a"
  host_recovery     = "on"
  auto_placement    = "on"
}

