# Input and output variable of EFS 
variable "EfsToken"        {}
variable "EfsTagName"      {}
variable "KMSKeyId"        {}
variable "Subnet_1"        {}
variable "Subnet_2"        {}
variable "SecurityGroupId" {}

output "efs_ID" {
  value = aws_efs_file_system.Efs.id
}
output "efs_dnsname" {
  value = aws_efs_file_system.Efs.dns_name
}
