resource "aws_key_pair" "key" {
  key_name = "aws-key"
  public_key = var.chave_rsa

}

resource "aws_instance" "vm" {
  ami = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key.key_name
  subnet_id = data.terraform_remote_state.vpc.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    name = "vm-terraform"
  }
}