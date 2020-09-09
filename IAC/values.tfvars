### CONFIG BASED ON REGION ###

RoleArn = "arn:aws:iam::128270211494:role/npiam_ec2_role"

VPCId = {
	    us-west-1      = "vpc-0c83cfd063c041a36"
	    ap-southeast-1 = "vpc-0ca177a0aa5302c5f"
}
TW_ALBName =  {
	    us-west-1      = "TW-AS-US-UAT-ALB"
	    ap-southeast-1 = "TW-AS-SG-UAT-ALB"
}
TW_ALBTargetGroupName = {
	    us-west-1      = "TW-AS-US-UAT-TG"
	    ap-southeast-1 = "TW-AS-SG-UAT-TG"
}
TW_ASGName = {
	    us-west-1      = "TW-AS-US-UAT-ASG"
	    ap-southeast-1 = "TW-AS-SG-UAT-ASG"
}
Subnets = {
	    us-west-1      = ["subnet-08635bbb17acc6c0a","subnet-0eeb6cb716a5d503b"]
	    ap-southeast-1 = ["subnet-0af0b5d68f555edcc","subnet-0a628418cbebdfd15"]
}
TW_LaunchTemplateName = {
	    us-west-1      = "TW-AS-US-UAT-LT"
	    ap-southeast-1 = "TW-AS-SG-UAT-LT"
}
AMIValue = {
	    us-west-1      = "ami-0d2f24be22e628b76"
	    ap-southeast-1 = "ami-086e09061dfe83ad5"
}
KMSKeyId = {
	    us-west-1      = "arn:aws:kms:us-west-1:128270211494:key/97f969d1-41db-4f70-9ad8-e1e9d6a0626c"
	    ap-southeast-1 = "arn:aws:kms:ap-southeast-1:128270211494:key/75779075-e8c7-4b33-b380-c4454c26d725"	 					
}
TW_ALB_SecurityGroupName = {
	    us-west-1      = "TW-AS-US-UAT-ALB-SG"
	    ap-southeast-1 = "TW-AS-SG-UAT-ALB-SG"
}
TW_ALB_SecurityGroupTagName  =  {
	    us-west-1      = "TW-AS-US-UAT-ALB-SG"					
	    ap-southeast-1 = "TW-AS-SG-UAT-ALB-SG"					
}
TW_ASG_SecurityGroupName = {
	    us-west-1      = "TW-AS-US-UAT-ASG-SG"
	    ap-southeast-1 = "TW-AS-SG-UAT-ASG-SG"
}
TW_ASG_SecurityGroupTagName = {
	    us-west-1      = "TW-AS-US-UAT-ASG-SG"
	    ap-southeast-1 = "TW-AS-SG-UAT-ASG-SG"
}
TW_EFS_SecurityGroupName = {
	    us-west-1      = "TW-AS-US-UAT-EFS-SG"
	    ap-southeast-1 = "TW-AS-SG-UAT-EFS-SG"
}
TW_EFS_SecurityGroupTagName = {
	    us-west-1      = "TW-AS-US-UAT-EFS-SG"
	    ap-southeast-1 = "TW-AS-SG-UAT-EFS-SG"
}
TW_EC2InstanceName = {
	    us-west-1      = "TW-AS-US-UAT-EC2"
	    ap-southeast-1 = "TW-AS-SG-UAT-EC2"
}
EfsToken = {
	    us-west-1      = "TW-AS-US-UAT-EFS"
	    ap-southeast-1 = "TW-AS-SG-UAT-EFS"
}
EfsTagName = {
	    us-west-1      = "TW-AS-US-UAT-EFS"
	    ap-southeast-1 = "TW-AS-SG-UAT-EFS"
}
Subnet_1 = {
	    us-west-1      = "subnet-08635bbb17acc6c0a"
	    ap-southeast-1 = "subnet-0af0b5d68f555edcc"
}
Subnet_2 = {
	    us-west-1      = "subnet-0eeb6cb716a5d503b"
	    ap-southeast-1 = "subnet-0a628418cbebdfd15"
}


### COMMON CONFIG ### 
### ALB CONFIG ###
InternalLB									= "true"
AlbType                                     = "application"
Env                                         = "UAT"

### ALB TARGET GROUP CONFIG ### 
ALBTargetGroupPort                          = "80"
ALBTargetGroupProtocol                      = "HTTP"
ALBHealthCheckEnablingStatus                = "true"
AlbHealthCheckInterval                      = "30"
AlbHealthCheckPath                          = "/"
AlbHealthCheckPort                          = "traffic-port"
AlbHealthCheckProtocol                      = "HTTP"
ALBHealthCheckTimeOutPeriod                 = "5"
HealthCheckHealthyCount                     = "3"
HealthCheckUnhealthyCount                   = "3"
AlbHelathCheckResultCode                    = "200"

### ALB LISTENER CONFIG ###
ALBListenerPort                             = "80"
ALBProtocol                                 = "HTTP"

### ASG CONFIG ### 
TW_ASGMinSize                               = "6"
TW_ASGMaxSize                               = "6"
TW_ASGDesiredCapacity                       = "6"
ASGHelthCheckGracePeriod                    = "300"
ASGHelathCheckType                          = "EC2"

### LT CONFIG ###							
TW_InstanceType                             = "m5.4xlarge"
TW_Userdata                                 = "as"
Tenancy                                     = "host"
EbsSecondarySize                            = "100"
												
### ALB SG CONFIG ###						
TW_ALB_EgressFromPort                       = 0
TW_ALB_EgressToPort                         = 0
TW_ALB_EgressProtocol                       = -1
TW_ALB_EgressCIDR                           = ["0.0.0.0/0"]
TW_ALB_IngressRule = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
    ]
				
### ASG SG CONFIG ###			 
TW_ASG_EgressFromPort                       = 0
TW_ASG_EgressToPort                         = 0
TW_ASG_EgressProtocol                       = -1
TW_ASG_EgressCIDR                           = ["0.0.0.0/0"]
TW_ASG_IngressRule = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
    ]
	
### EFS SG CONFIG ###				 
TW_EFS_EgressFromPort                       = 0
TW_EFS_EgressToPort                         = 0 
TW_EFS_EgressProtocol                       = -1
TW_EFS_EgressCIDR                           = ["0.0.0.0/0"]	
TW_EFS_IngressRule = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks  = "10.193.0.0/16"
          description = "test"
        },
    ]
	
