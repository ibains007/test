locals {
  user_data = <<-EOT
    #!/bin/bash -x
    curl -sL https://releases.rancher.com/install-docker/${var.docker_version}.sh | sh
    sudo usermod -aG docker ${var.ec2_user}
    ${var.rke_control_node_command} --node-name ${var.asg_prefix}-`hostname -s` ${var.rke_command_roles}
  EOT
}