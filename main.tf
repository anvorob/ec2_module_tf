data "aws_ami" "main" {
  count = var.ami_id == null ? 1 : 0
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
  ami = var.ami_id != null ? var.ami_id : data.aws_ami.main[0].id
  subnet_id = var.subnet_id
  key_name = var.key_name
  security_groups = var.sg_list
  #instance_market_options {
  #  market_type = "spot"
  #  spot_options {
  #    max_price = 0.0031
  #  }
  #}
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}
