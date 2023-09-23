# How to use: 

Add commands for provisioning infrastructure

# Tooling and methods 

Terraform 

Kubectl 

AWS  

# Relies upon 

https://github.com/masipcat/wireguard-go-docker

https://www.techtarget.com/searchcloudcomputing/tutorial/How-to-deploy-an-EKS-cluster-using-Terraform

Need to finish the Terraform configuration files, run format, init and plan. 

TODO: 

--> Create Kubectl configuration from the aws cli 
https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/

--> Check networkports and configure them in the vpcbuild.tf 
https://blog.jamesclonk.io/posts/wireguard-on-kubernetes/

--> Configure workernodes roles and specs in the clusterbuild.tf 

--> Merge the vpcbuild with the clusterbuild for ease of use 

~/go/bin/tfk8s -f resources/wireguard-deployment.yaml -o output.tf


Runnning terragrunt 

https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/

For each region you with to use, create new worker folder 