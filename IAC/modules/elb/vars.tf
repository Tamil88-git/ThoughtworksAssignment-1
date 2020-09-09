variable "ALBName" 						{  }
variable "InternalLB"                   {  }
variable "AlbType"                      {  }
variable "SecurityGroupId"              {  }
variable "Subnets"                      {  }
variable "Env"                          {  }
variable "ALBTargetGroupName"           {  }
variable "ALBTargetGroupPort"           {  }
variable "ALBTargetGroupProtocol"       {  }
variable "VPCId"                        {  }
variable "ALBHealthCheckEnablingStatus" {  }
variable "AlbHealthCheckInterval"       {  }
variable "AlbHealthCheckPath"           {  }
variable "AlbHealthCheckPort"           {  }
variable "AlbHealthCheckProtocol"       {  }
variable "ALBHealthCheckTimeOutPeriod"  {  }
variable "HealthCheckHealthyCount"      {  }
variable "HealthCheckUnhealthyCount"    {  }
variable "AlbHelathCheckResultCode"     {  }
variable "ALBListenerPort"              {  }
variable "ALBProtocol"                  {  }


output "ALBTargetGroupARN" {
value=aws_lb_target_group.ALBTargetGroup.arn
}
output "ALBARN" {
value=aws_lb.ALB.arn
}
