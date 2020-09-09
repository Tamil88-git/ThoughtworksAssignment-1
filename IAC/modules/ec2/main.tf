# take the dnsname 

data "template_file" "script" {
    template    = file("../modules/ec2/userdata_${var.Userdata}.sh")
    vars        = { 
                       EfsDNSName = var.EfsDNSName
                  }
} 
                 

# Creation of launch template
resource "aws_launch_template" "LaunchTemplate" {
    name                    = var.LaunchTemplateName
    vpc_security_group_ids  = [var.SecurityGroupId]
    image_id                = var.AMIValue
    instance_type           = var.InstanceType
    user_data               = base64encode(data.template_file.script.rendered)    ##filebase64(var.Userdata)
	network_interfaces {
        subnet_id           = var.subnet   
	}
    placement {
        tenancy             = var.Tenancy   
	}
	tag_specifications {
        resource_type       = "instance"
         tags= {
             Name           = var.EC2InstanceName
			 Project        = "TW"
            }
        }
    block_device_mappings {
    device_name = "/dev/sdb"
    ebs  {                    
        volume_type = "gp2"
        volume_size = var.EbsSecondarySize
        encrypted = "true"
        kms_key_id =var.KMSKeyId
		}
	}
}

