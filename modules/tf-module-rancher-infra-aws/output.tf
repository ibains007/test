# Outputs

output "rancher_nodes" {
  value = [
  	for instance in flatten([[aws_instance.node_all], [aws_instance.node_master], [aws_instance.node_worker]]): {
    
    public_ip  = instance.public_ip
    private_ip = instance.private_ip
    hostname   = instance.id
    user       = var.node_username
    roles      = split(",", var.roles)
    ssh_key    = var.ssh_key_file
    }
  ]
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_ids" {
   //value = [for s in data.aws_subnet_ids.available : s.ids]
   value = tolist(data.aws_subnet_ids.available.ids)
}

//data "aws_subnet_ids" "available" {
//  vpc_id = data.aws_vpc.default.id
//}


