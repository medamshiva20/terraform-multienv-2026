locals{
    ami_id = data.aws_ami.sivadevops.id
    environment = terraform.workspace
}