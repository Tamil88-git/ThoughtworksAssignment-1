#Input and Output variables in launch template
variable "LaunchTemplateName" {}
variable "SecurityGroupId"    {}
variable "AMIValue"           {}
variable "InstanceType"       {}
variable "Userdata"           {}
variable "Tenancy"            {}
variable "EbsSecondarySize"   {}
variable "KMSKeyId"           {}
variable "EC2InstanceName"    {}
variable "EfsDNSName"         {
	default     = ""
}
variable "subnet"           {
	default     = ""
}

output "LaunchTemplateId" {
    value = aws_launch_template.LaunchTemplate.id
}
