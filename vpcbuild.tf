resource "aws_vpc" "kubeguard-vpc" {
  cidr_block = "13.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags = {
    "Project" = "Kubeguard"
  }
}

resource "aws_subnet" "kubeguard-kayn-subnet" {
  vpc_id = "${aws_vpc.kubeguard-vpc.id}"
  cidr_block = "13.0.1.0/16"
  map_pmap_public_ip_on_launch = "true" //Change to false for private subnet 
  avavailability_zone = "ca-central-1"

  tags = {
    "Project" = "Kubeguard"
  }   
}

resource "aws_subnet" "kubeguard-abel-subnet" {
  vpc_id = "${aws_vpc.kubeguard-vpc.id}"
  cidr_block = "13.0.2.0/16"
  map_pmap_public_ip_on_launch = "true" //Change to false for private subnet 
  avavailability_zone = "ca-central-1"

  tags = {
    "Project" = "Kubeguard"
  }     
}

resource "aws_internet_gateway" "kubeguard-igw" {
  vpc_id = "${aws_vpc.kubeguard-vpc.id}"
  tags = {
    "Project" = "Kubeguard"
  }
}

#Custom routing table needs to be tightened up 
resource "aws_route_table" "kubeguard-public-crt" {
    vpc_id = "${aws_vpc.kubeguard-vpc.id}"
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"         //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.kubeguard-igw.id}" 
    }

  tags = {
    "Project" = "Kubeguard"
  }
}


#Attaches the custom routing table build previously to both subnets 
resource "aws_route_table_association" "prod-crta-public-subnet-kayn"{
    subnet_id = "${aws_subnet.kubeguard-kayn-subnet.id}"
    route_table_id = "${aws_route_table.kubeguard-public-crt.id}"

    tags = {
    "Project" = "Kubeguard"
  }
}

resource "aws_route_table_association" "prod-crta-public-subnet-abel"{
    subnet_id = "${aws_subnet.kubeguard-abel-subnet.id}"
    route_table_id = "${aws_route_table.kubeguard-public-crt.id}"

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