resource "aws_key_pair" "rke_key_pair" {
  key_name        = "${var.asg_prefix}-keypair"
  public_key      = var.ssh_pub_file
  tags = {
	Name = "${var.asg_prefix}-keypair"
 }

}

