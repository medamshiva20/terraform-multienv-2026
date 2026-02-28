data "aws_ami" "sivadevops"{
    most_recent = true 
    owners = ["632193298015"]

    filter {
        name = "name"
        values = "Siva-AMI"
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter{
        name = "virtulization-type"
        values = ["hvm"]
    }
}