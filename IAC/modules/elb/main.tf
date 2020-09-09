resource "aws_lb" "ALB" {
    name                       = var.ALBName
    internal                   = var.InternalLB
    load_balancer_type         = var.AlbType
    security_groups            = [var.SecurityGroupId]
    subnets                    = var.Subnets
    enable_deletion_protection = false
    tags = {
        Environment            = var.Env
           }
}

resource "aws_lb_target_group" "ALBTargetGroup" {
    name                       = var.ALBTargetGroupName
    port                       = var.ALBTargetGroupPort
    protocol                   = var.ALBTargetGroupProtocol
    vpc_id                     = var.VPCId
    health_check {
        enabled				   = var.ALBHealthCheckEnablingStatus
        interval               = var.AlbHealthCheckInterval
        path                   = var.AlbHealthCheckPath
        port                   = var.AlbHealthCheckPort
        protocol               = var.AlbHealthCheckProtocol
        timeout                = var.ALBHealthCheckTimeOutPeriod
        healthy_threshold      = var.HealthCheckHealthyCount
        unhealthy_threshold    = var.HealthCheckUnhealthyCount
        matcher 			   = var.AlbHelathCheckResultCode
                 }               
}

resource "aws_lb_listener" "ALBListener" {
    load_balancer_arn          = aws_lb.ALB.arn
    port                       = var.ALBListenerPort
    protocol                   = var.ALBProtocol
    default_action {           
      type                     = "forward"
      target_group_arn         = aws_lb_target_group.ALBTargetGroup.arn
    }
}
