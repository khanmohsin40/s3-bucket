provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "myinstance-s3" {
ami = "ami-0c7217cdde317cfec"
instance_type = "t2.micro"
key_name = "13dec"
vpc_security_group_ids = [aws_security_group.s3-bucket-prod]
user_data = file(s3.tf)

tags = {
  name = mys3instance
}
  
}

resource "aws_security_group" "s3-bucket" {
    description = "s3-bucket-prod"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [0.0.0.0/0]
    }
  
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [0.0.0.0/0]
    }
    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [0.0.0.0/0]
    }
    
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [0.0.0.0/0]
    }
}