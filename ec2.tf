resource "aws_key_pair" "my-key" {
  key_name   = "${var.env}-terra-key"
  public_key = file("./my-terra-key.pub")    
  tags = {
    Name = "${var.env}-terra-key"
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "automate_ec2_sg" {
  name        = "${var.env}_automate_ec2_sg"
  description = "Automate EC2 security group"

  vpc_id = aws_default_vpc.default.id

  tags = {
    Name= "${var.env}-automate-sg"
     Environment = var.env
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  # count = 2
  for_each = tomap({
    "${var.env}-auto-instance" = "t2.micro"
  })

  depends_on = [ aws_security_group.automate_ec2_sg, aws_key_pair.my-key , aws_default_vpc.default ]
  key_name = aws_key_pair.my-key.key_name
  security_groups = [ aws_security_group.automate_ec2_sg.name ]
  # instance_type = "t2.micro"  
  instance_type = each.value 
  ami = var.ec2_ami_id
  root_block_device {
    volume_size = var.env == "prd"? 8 : var.ec2_root_volume_size
    volume_type = "gp3"
  }
  # user_data = file("./install_nginx.sh")
  tags = {
    Name = each.key 
    Environment = var.env
  }
}
