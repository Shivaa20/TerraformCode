terraform {
  required_providers{
    aws = {
        source = "hashicorp/aws"
        version = "=3.0.0"
    }
  }
}


#configuring the aws provider 
provider "aws" {
  region = "us-east-1"
  access_key = 
  secret_key = 
}


 resource "aws_vpc" "vpc1"{
    cidr_block = "10.0.0.0/24"
  tags = {

  }
 }

 resource "aws_vpc" "vpc2"{
    cidr_block = "10.0.128.0/20"
  tags = {
  }
 }

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "FirstVPCSubnet"
  }
}

resource "aws_subnet" "privatesubnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.128.0/20"
  tags = {
    Name = "FirstVPCPrivateSubnet"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.vpc2.id
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "SecondVPCSubnet"
  }
}

resource "aws_subnet" "privatesubnet2" {
  vpc_id     = aws_vpc.vpc2.id
  cidr_block = "10.0.128.0/20"
  tags = {
    Name = "SecondVPCPrivateSubnet"
  }
}



resource "aws_instance" "instance1" {
    ami = "ami-090fa75af13c156b4"
    instance_type = "t2.micro"
    vpc_id     = aws_vpc.vpc1.id
    availability_zone = "us-east-1a"

}

resource "aws_instance" "instance2"{
ami = "ami-090fa75af13c156b4"
instance_type = "t2.micro"
vpc_id  = aws_vpc.vpc2.id
availability_zone = "us-east-1b"
}

resource "aws_instance" "instance2"{
ami = "ami-090fa75af13c156b4"
instance_type = "t2.micro"
vpc_id  = aws_vpc.vpc2.id
availability_zone = "us-east-1b"
}


  
  


