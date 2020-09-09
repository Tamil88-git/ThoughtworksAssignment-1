variable "Region"                               {  }  ## This parameter will be pTWsed in the command line which hTW highest priority in taking variable value

variable "RoleArn"                              {  }

variable VPCId 									{
    type = map
  }
variable "TW_EC2InstanceName"                   {
    type = map
  }
variable "TW_ALBName"                           {
    type = map
  }
variable "TW_ALBTargetGroupName"                {
    type = map
  }
variable "TW_ASGName"                           {
    type = map
  }
variable "Subnets"                              {
    type = map
  }
variable "TW_LaunchTemplateName"                {
    type = map
  }
variable "AMIValue"                             {
    type = map
  }
variable "KMSKeyId"                             {
    type = map
  }
variable "TW_ALB_SecurityGroupName"             {
    type = map
  }
variable "TW_ALB_SecurityGroupTagName"          {
    type = map
  }
variable "TW_ASG_SecurityGroupName"             {
    type = map
  }
variable "TW_ASG_SecurityGroupTagName"          {
    type = map
  }
variable "TW_EFS_SecurityGroupName"             {
    type = map
  }
variable "TW_EFS_SecurityGroupTagName"          {
    type = map
  }
variable "EfsToken"                             { 
    type = map
  }
variable "EfsTagName"                             { 
    type = map
  }  
variable "Subnet_1"                             {
    type = map
  }
variable "Subnet_2"                             {
    type = map
  }

variable "InternalLB"                           {  }
variable "AlbType"                              {  }
variable "Env"                                  {  }
variable "ALBTargetGroupPort"                   {  }
variable "ALBTargetGroupProtocol"               {  }
variable "ALBHealthCheckEnablingStatus"         {  }
variable "AlbHealthCheckInterval"               {  }
variable "AlbHealthCheckPath"                   {  }
variable "AlbHealthCheckPort"                   {  }
variable "AlbHealthCheckProtocol"               {  }
variable "ALBHealthCheckTimeOutPeriod"          {  }
variable "HealthCheckHealthyCount"              {  }
variable "HealthCheckUnhealthyCount"            {  }
variable "AlbHelathCheckResultCode"             {  }
variable "ALBListenerPort"                      {  }
variable "ALBProtocol"                          {  }
variable "TW_ASGMinSize"                        {  }
variable "TW_ASGMaxSize"                        {  }
variable "TW_ASGDesiredCapacity"                {  }
variable "ASGHelthCheckGracePeriod"             {  }
variable "ASGHelathCheckType"                   {  }

variable "TW_InstanceType"                      {  }
variable "TW_Userdata"                          {  }
variable "Tenancy"                              {  }
variable "EbsSecondarySize"                     {  }

variable "TW_ALB_EgressFromPort"                {  }
variable "TW_ALB_EgressToPort"                  {  }
variable "TW_ALB_EgressProtocol"                {  }
variable "TW_ALB_EgressCIDR"                    {  }
variable "TW_ALB_IngressRule" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = string
      description = string
    })) 
	}

variable "TW_ASG_EgressFromPort"                {  }
variable "TW_ASG_EgressToPort"                  {  }
variable "TW_ASG_EgressProtocol"                {  }
variable "TW_ASG_EgressCIDR"                    {  }
variable "TW_ASG_IngressRule" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = string
      description = string
    })) 
	}

variable "TW_EFS_EgressFromPort"                {  }
variable "TW_EFS_EgressToPort"                  {  }
variable "TW_EFS_EgressProtocol"                {  }
variable "TW_EFS_EgressCIDR"                    {  }
variable "TW_EFS_IngressRule" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = string
      description = string
    })) 
	}
