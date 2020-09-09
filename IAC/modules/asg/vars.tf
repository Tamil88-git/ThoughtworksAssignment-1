### Auto scaling group variable definition ###
variable "ALBTargetGroupARN"            { 
    default = ""
 }
variable "Subnets"                      {  }
variable "ASGName"                      {  }
variable "LaunchTemplateId"             {  }
variable "ASGMinSize"                   {  }
variable "ASGMaxSize"                   {  }
variable "ASGDesiredCapacity"           {  }
variable "ASGHelthCheckGracePeriod"     {  }
variable "ASGHelathCheckType"           {  }
