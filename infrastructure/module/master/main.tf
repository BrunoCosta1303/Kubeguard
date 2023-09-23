#! https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#! https://www.tderflinger.com/en/ec2-spot-with-terraform
#! https://medium.com/@khimananda.oli/terraform-aws-ec2-and-system-manager-e0f0c914132c
resource "aws_instance" "master-k3s-host" {
  instance_type     = var.instance_configuration.instance_type
  ami = data.ubuntu_latest.id
  subnet_id = ""
  vpc_security_group_ids = ""
  associate_public_ip_address = true 
  iam_instance_profile = ""
  security_groups = []
  secondary_private_ips = []
  user_data = "" #! resources/tools/apt-based/setup-master.sh -> add cli command: https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ssm/put-parameter.html
  # OR https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ssm/update-document.html
  metadata_options {
    
  }
  network_interface {
    
  }
  private_dns_name_options {
    
  }

  root_block_device {
    encrypted = true 
    iops = gp3
    volume_size = 30
    volume_type = gp3

  }
}

