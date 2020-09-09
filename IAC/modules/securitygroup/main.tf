resource "aws_security_group" "SecurityGroup" {
    name           = var.SecurityGroupName
    description    = "Security group for DIH"
    vpc_id         = var.VPCId              
    egress {       
      from_port    = var.EgressFromPort
      to_port      = var.EgressToPort
      protocol     = var.EgressProtocol
      cidr_blocks  = var.EgressCIDR
    }
    tags = {
        Name	   = var.SecurityGroupTagName
    }
}


resource "aws_security_group_rule" "IngressRule" {
  count             = length(var.IngressRule)
  type              = "ingress"
  from_port         = var.IngressRule[count.index].from_port
  to_port           = var.IngressRule[count.index].to_port
  protocol          = var.IngressRule[count.index].protocol
  cidr_blocks       = [var.IngressRule[count.index].cidr_blocks]
  description       = var.IngressRule[count.index].description
  security_group_id = aws_security_group.SecurityGroup.id
}
