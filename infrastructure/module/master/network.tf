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

resource "aws_vpc_peering_connection" "foo" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.bar.id
  vpc_id        = aws_vpc.foo.id
  auto_accept = true 

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}