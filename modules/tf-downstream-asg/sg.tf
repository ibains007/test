#Control node ASG security group
resource "aws_security_group" "sg" {
  name        = "${var.asg_prefix}_sg"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 2376
    protocol    = "TCP"
    to_port     = 2376
    cidr_blocks = ["0.0.0.0/0"]
  }


 ingress {
    from_port   = 2379
    protocol    = "TCP"
    to_port     = 2380
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 8472
    protocol    = "UDP"
    to_port     = 8472
    cidr_blocks = ["0.0.0.0/0"]
  }


 ingress {
    from_port   = 9099
    protocol    = "TCP"
    to_port     = 9099
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 10250
    protocol    = "TCP"
    to_port     = 10250
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 6443
    protocol    = "TCP"
    to_port     = 6443
    cidr_blocks = ["0.0.0.0/0"]
  }



 egress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 2379
    protocol    = "TCP"
    to_port     = 2380
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 6443
    protocol    = "TCP"
    to_port     = 6443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8472
    protocol    = "UDP"
    to_port     = 8472
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 4789
    protocol    = "UDP"
    to_port     = 4789
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 10250
    protocol    = "TCP"
    to_port     = 10250
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 9099
    protocol    = "TCP"
    to_port     = 9099
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 10254
    protocol    = "TCP"
    to_port     = 10254
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port   = 2181
    protocol    = "TCP"
    to_port     = 2181
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 9093
    protocol    = "TCP"
    to_port     = 9093
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 9092
    protocol    = "TCP"
    to_port     = 9092
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 9094
    protocol    = "TCP"
    to_port     = 9094
    cidr_blocks = ["0.0.0.0/0"]
  }
 
 tags = {
    Name = "${var.asg_prefix}-rke_sg"
    "kubernetes.io/cluster/${var.rke_cluster_id}" = "Owned"

 }

}
