provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}
output "ip" {
  value = aws_eip.ip.public_ip
}