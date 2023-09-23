resource "aws-security-group" "kubeguard-ingress-rule" {
  vpc_id = "${aws_vpc.kubeguard-vpc.id}"

  egress = {
    from_port = ""
    to_port = ""
    protocol = ""
    cidr_block = [""]
  }

  ingress = {
    from_port = ""
    to_port = ""
    protocol = ""
    cidr_block = [""]
  }

  tags = {
    "Project" = "Kubeguard"
  }
}

resource "aws-security-group" "kubeguard-egress-rule" {
  vpc_id = "${aws_vpc.kubeguard-vpc.id}"

  egress = {
    from_port = ""
    to_port = ""
    protocol = ""
    cidr_block = [""]
  }

  ingress = {
    from_port = ""
    to_port = ""
    protocol = ""
    cidr_block = [""]
  }

  tags = {
    "Project" = "Kubeguard"
  }
}