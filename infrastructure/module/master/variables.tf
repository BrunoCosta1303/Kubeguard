variable "aws_region" {
    type = string
    descridescription = "aws region to deploy the resouces" 
    default = us-east-1
}
#eu-south-2, us-east-1, eu-central-2
variable "aws_profile" {
    type = string
    descridescription = "aws profile for authentication" 
    default = "default"
}

variable "instance_configuration" {
    description = "Region and subnet configuration for deploying instances"
    type = map 
}

# variable "instance_type" {
#     type = string
#     descridescription = "instance family to be used" 
#     default = "default"
# }

# variable "instance_type" {
#     type = string
#     descridescription = "instance family to be used" 
#     default = "default"
# }

# instance_configuration = {
#     ami = ""
#     count = ""
#     subnet_id = ""
#     instance_type = ""
# }

#Case it becomes to expansive, cut one region and uso only t4g.small, but rly like wtf just go for it 
# variable "instance_type" {
#     type = list
#     default = [t3.micro, t2.micro, t4g.small]
# }


