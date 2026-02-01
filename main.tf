data "aws_ami" "main" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "boot-mode"
    values = ["legacy-bios"] 
  }
}

resource "aws_instance" "main" {
  ami = data.aws_ami.main.id
  subnet_id = var.subnet_id
  key_name = var.key_name
  security_groups = var.sg_list
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = 0.0031
    }
  }
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}
