resource "aws_instance" "multienv"{
    ami = local.ami_id
    instance_type = lookup(var.instance_type,local.environment)
    vpc_security_group_ids = [aws_security_group.allow-tls.id]

    tags = {
        Name = "${var.project}-${local.environment}"
        Project = "roboshop"
        Environment = local.environment
    }
}

resource "aws_security_group" "allow-tls"{
    name = "allow-all-terraform-${local.environment}" # this is for AWS account"
    description = "Allow TLS inbound traffic and all outbound traffic"

    ingress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags ={
        Name = "allow-all-terraform-${local.environment}"
    }
}