#Control ASG

variable "depend_on" {
  type    = list
  default = []
}

resource "null_resource" "dependency_getter" {
  provisioner "local-exec" {
    command = "echo ${length(var.depend_on)}"
  }
}


resource "aws_autoscaling_group" "asg" {
  count                     = var.asg_count
  name                      = "${var.asg_prefix}-${var.asg_name}-${count.index}"
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  health_check_type         = var.asg_healthcheck_type
  desired_capacity          = var.asg_desired_capacity
  force_delete              = true
  launch_configuration      = aws_launch_configuration.launch-config.name
  vpc_zone_identifier       = var.multi_az ? tolist(var.aws_subnet_ids):[element(tolist(var.aws_subnet_ids), count.index)]
  
  lifecycle {
    create_before_destroy   = true
  }

 tags = concat(
 [
 {  
    key                 = "Name"
    value               = "${var.rke_prefix}-${var.asg_prefix}-${count.index}"
    propagate_at_launch = true
 },
 {
    key                 = "${var.prefix}${var.rke_cluster_id}"
    value               = "owned"
    propagate_at_launch = true
 }
 ]
 ) 
 
 depends_on = [ null_resource.dependency_getter ]
}

resource "null_resource" "node_dependency_setter" {
  depends_on = [
    aws_autoscaling_group.asg
  ]
}


