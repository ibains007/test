# Notejam Demo
This Project Deploys the notejam app into a RKE cluster running in AWS

no sign


# Pre-Reqs

# Terraform Version:  v0.14.10

As this project deploys the RKE cluster into the default VPC, the VPC and Subnets need to be tagged for the Kubernetes Cloud Provider to be able to provision the loadbalancer. If using the default supplied this needs to be 
```
key: kubernetes.io/cluster/C-3328 
value: owned
```
The public subnets should also have the additional tags
```
key: kubernetes.io/role/elb	
value: -1
```
## Terraform variables

### AWS credentials
The AWS provider is expecting the credentials to be exported as environment variables. Export your credentials as
```
export AWS_ACCESS_KEY_ID=XXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXX
export TF_VAR_region=eu-west-2
```

### EC2 bootstrap

In order to create a key pair to ssh into the EC2 instances a keypair export variables for Public an Private keys
```
export TF_VAR_ssh_pub_file=$(cat ~/.ssh/id_rsa.pub)
export TF_VAR_ssh_pub_file=$(cat ~/.ssh/id_rsa.pub)
```

### R53 Domain
This project does not create a DNS zone, so an existing zone id must be supplied as a variable
```
export TF_VAR_zone_id=Z06924942AT5KS2GNNGTN
```

## S3 Bucket

The terraform state is stored in a s3 bucket, and the bucket name needs to be update in the main.tf block
```
terraform {
  required_version  =  "~> 0.14.10"
  backend  s3 {
  bucket =  ##BucketName##
  key =  "terraform.tfstate"
  region =  "eu-west-2"
}
```

# Deployment

1) Initialise terraform from the root of the repo 
``` terraform init```
2) Review and apply infrastructure changes
``` terraform apply ```
3) To tear down the deployment
``` 
terraform state rm module.notejam_deployment  module.rke-cluster module.rancher_server  module.downstream-custom-cluster module.downstream-rke-template

terraform destroy 
```
# Usage

The notejam application fqdn will be output on successful completion of the terraform apply. 

```i.e. notejam.example.com ```

# Known Issue
>Issue: App deployment can fail if the cluster isnt fully ready. 
>Workaround: Wait until the cluster is ready then re-run the terraform apply

>Issue: Currently the provisioned loadbalancer does not get deleted as part of the terraform destroy
>Workround: manually delete the loadbalancer from the AWS console
