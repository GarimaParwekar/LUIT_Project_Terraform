# Create Security Group for Jenkins
resource "aws_security_group" "jenkins_sg_1" {
  name        = "jenkins-sg-1"
  description = "Allow port 22 and 8080"

  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080 traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins server security group"
  }
}

# Launch the EC2 instance and install Jenkins
resource "aws_instance" "ec2_instance_new" {
  ami                    = var.ami-id
  instance_type          = var.instance-type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_sg_1.id]
  user_data              = file("jenkins_install.sh")

  tags = {
    Name = "terraform_web_server_new"
  }
}

# Create a private S3 bucket
resource "aws_s3_bucket" "buckettf" {
  bucket = var.jenkins-s3-bucket # This needs to be globally unique

  tags = {
    Name        = "myTerraformS3bucketnew"
    Environment = "Dev"
  }
}
