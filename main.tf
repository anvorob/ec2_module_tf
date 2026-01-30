data "aws_ami" "main" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "example" {
  ami = data.aws_ami.example.id
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
