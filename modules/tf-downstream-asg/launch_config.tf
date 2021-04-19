#Control launch config

resource "aws_launch_configuration" "launch-config" {
  name                     = "${var.asg_prefix}-${var.rke_launch_config_name}"
  image_id                 = var.rke_ami_name
  instance_type            = var.rke_instance_type
  //iam_instance_profile     = aws_iam_instance_profile.profile.name
  iam_instance_profile     = var.instance_profile
  security_groups          = [aws_security_group.sg.id]
  user_data                = local.user_data
  key_name                 = aws_key_pair.rke_key_pair.key_name
  root_block_device {
    volume_type            = var.root_volume_type
    volume_size            = var.root_volume_size
    delete_on_termination  = var.root_volume_delete_on_termination
  }

  
  lifecycle {
    create_before_destroy = true
  }

}

