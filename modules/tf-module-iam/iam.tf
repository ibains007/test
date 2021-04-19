resource "aws_iam_policy" "K8sAutoscalerProfile" {
  name        = var.K8sAutoscalerProfile_name
  path        = "/"
  description = "Autoscale profile"

  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "autoscaling:DescribeAutoScalingGroups",
                  "autoscaling:DescribeAutoScalingInstances",
                  "autoscaling:DescribeLaunchConfigurations",
                  "autoscaling:SetDesiredCapacity",
                  "autoscaling:TerminateInstanceInAutoScalingGroup",
                  "autoscaling:DescribeTags",
                  "autoscaling:DescribeLaunchConfigurations",
                  "ec2:DescribeLaunchTemplateVersions"
              ],
              "Resource": [
                  "*"
              ]
          }
      ]
  }
EOF
}

resource "aws_iam_policy" "K8sMasterProfile" {
  name        = var.K8sMasterProfile_name
  path        = "/"
  description = "K8s Master Profile"

  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "autoscaling:DescribeAutoScalingGroups",
                  "autoscaling:DescribeLaunchConfigurations",
                  "autoscaling:DescribeTags",
                  "ec2:DescribeInstances",
                  "ec2:DescribeRegions",
                  "ec2:DescribeRouteTables",
                  "ec2:DescribeSecurityGroups",
                  "ec2:DescribeSubnets",
                  "ec2:DescribeVolumes",
                  "ec2:CreateSecurityGroup",
                  "ec2:CreateTags",
                  "ec2:CreateVolume",
                  "ec2:ModifyInstanceAttribute",
                  "ec2:ModifyVolume",
                  "ec2:AttachVolume",
                  "ec2:AuthorizeSecurityGroupIngress",
                  "ec2:CreateRoute",
                  "ec2:DeleteRoute",
                  "ec2:DeleteSecurityGroup",
                  "ec2:DeleteVolume",
                  "ec2:DetachVolume",
                  "ec2:RevokeSecurityGroupIngress",
                  "ec2:DescribeVpcs",
                  "elasticloadbalancing:AddTags",
                  "elasticloadbalancing:AttachLoadBalancerToSubnets",
                  "elasticloadbalancing:ApplySecurityGroupsToLoadBalancer",
                  "elasticloadbalancing:CreateLoadBalancer",
                  "elasticloadbalancing:CreateLoadBalancerPolicy",
                  "elasticloadbalancing:CreateLoadBalancerListeners",
                  "elasticloadbalancing:ConfigureHealthCheck",
                  "elasticloadbalancing:DeleteLoadBalancer",
                  "elasticloadbalancing:DeleteLoadBalancerListeners",
                  "elasticloadbalancing:DescribeLoadBalancers",
                  "elasticloadbalancing:DescribeLoadBalancerAttributes",
                  "elasticloadbalancing:DetachLoadBalancerFromSubnets",
                  "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
                  "elasticloadbalancing:ModifyLoadBalancerAttributes",
                  "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
                  "elasticloadbalancing:SetLoadBalancerPoliciesForBackendServer",
                  "elasticloadbalancing:AddTags",
                  "elasticloadbalancing:CreateListener",
                  "elasticloadbalancing:CreateTargetGroup",
                  "elasticloadbalancing:DeleteListener",
                  "elasticloadbalancing:DeleteTargetGroup",
                  "elasticloadbalancing:DescribeListeners",
                  "elasticloadbalancing:DescribeLoadBalancerPolicies",
                  "elasticloadbalancing:DescribeTargetGroups",
                  "elasticloadbalancing:DescribeTargetHealth",
                  "elasticloadbalancing:ModifyListener",
                  "elasticloadbalancing:ModifyTargetGroup",
                  "elasticloadbalancing:RegisterTargets",
                  "elasticloadbalancing:SetLoadBalancerPoliciesOfListener",
                  "iam:CreateServiceLinkedRole",
                  "ecr:GetAuthorizationToken",
                  "ecr:BatchCheckLayerAvailability",
                  "ecr:GetDownloadUrlForLayer",
                  "ecr:GetRepositoryPolicy",
                  "ecr:DescribeRepositories",
                  "ecr:ListImages",
                  "ecr:BatchGetImage",
                  "kms:DescribeKey"
              ],
              "Resource": [
                  "*"
              ]
          }
      ]
  }
EOF
}


resource "aws_iam_role" "K8sMasterRole" {
  name = var.K8sMasterRole_name

  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}


resource "aws_iam_role_policy_attachment" "k8-policy-attach-master" {
  role       = aws_iam_role.K8sMasterRole.name
  policy_arn = aws_iam_policy.K8sMasterProfile.arn
}

resource "aws_iam_role_policy_attachment" "policy-attach-asg" {
  role       = aws_iam_role.K8sMasterRole.name
  policy_arn = aws_iam_policy.K8sAutoscalerProfile.arn
}

###IAM profile for Worker
resource "aws_iam_policy" "K8sWorkerProfile" {
  name        = var.K8sWorkerProfile_name
  path        = "/"
  description = "$IAM Profile for Workers"

  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "ec2:DescribeInstances",
                  "ec2:DescribeRegions",
                  "ecr:GetAuthorizationToken",
                  "ecr:BatchCheckLayerAvailability",
                  "ecr:GetDownloadUrlForLayer",
                  "ecr:GetRepositoryPolicy",
                  "ecr:DescribeRepositories",
                  "ecr:ListImages",
                  "ecr:BatchGetImage"
              ],
              "Resource": "*"
          }
      ]
  }
EOF
}

resource "aws_iam_role" "K8sWorkerRole" {
  name = var.K8sWorkerRole_name

  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}


resource "aws_iam_role_policy_attachment" "k8-policy-attach-worker" {
  role       = aws_iam_role.K8sWorkerRole.name
  policy_arn = aws_iam_policy.K8sWorkerProfile.arn
}

resource "aws_iam_instance_profile" "control_profile" {
name  = var.control_profile_name
role = aws_iam_role.K8sMasterRole.name
}

resource "aws_iam_instance_profile" "worker_profile" {
name  = var.worker_profile_name
role = aws_iam_role.K8sWorkerRole.name
}