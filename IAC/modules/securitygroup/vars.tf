# Input and Output variables of security group
variable "SecurityGroupName"             {  }          
variable "VPCId"						 {  }
variable "EgressFromPort"                {  } 
variable "EgressToPort"                  {  }
variable "EgressProtocol"                {  }
variable "EgressCIDR"                    {  }
variable "SecurityGroupTagName"          {  } 


variable "IngressRule" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = string
      description = string
    })) 
	} 
	
	
output "SecurityGroupId" {
  value = aws_security_group.SecurityGroup.id
}
