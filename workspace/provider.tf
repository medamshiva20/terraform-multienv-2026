terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "6.33.0"
        }
    }
    backend "s3"{
        bucket = "remote-state-file-88s"
        key = "remote-state.tfstate"
        region = "us-east-1"
        encrypt = true 
        use_lockfile = true
    }
}