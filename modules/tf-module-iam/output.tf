output "control_instance_profile" {
  value = aws_iam_instance_profile.control_profile.name
}

output "worker_instance_profile" {
  value = aws_iam_instance_profile.worker_profile.name
}
