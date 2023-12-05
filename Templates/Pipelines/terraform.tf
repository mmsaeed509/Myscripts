#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# Specify the provider (in this case, AWS)
provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Define an EC2 instance resource
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"              # Replace with your desired instance type

  tags = {
    Name = "ExampleInstance"
  }
}

# Output the instance's public IP address
output "public_ip" {
  value = aws_instance.example.public_ip
}
