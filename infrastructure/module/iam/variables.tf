variable "aws_regions" {
    type = list
    descridescription = "aws region to deploy the resouces" 
    default = [eu-south-2, us-east-1, eu-central-2]
}

variable "aws_profile" {
    type = string
    descridescription = "aws profile for authentication" 
    default = "default"
}

variable "instance_configuration" {
    description = "Region and subnet configuration for deploying instances"
    type = map 
}

#Case it becomes to expansive, cut one region and uso only t4g.small, but rly like wtf just go for it 
# variable "instance_type" {
#     type = list
#     default = [t3.micro, t2.micro, t4g.small]
# }


