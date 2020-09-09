### Auto scaling group resource definition ###
resource "aws_autoscaling_group" "ASGGroup" {
    name                       = var.ASGName
    launch_template {
        id                     = var.LaunchTemplateId
        version                = "$Latest"
       }
    default_cooldown           = 500
    vpc_zone_identifier        = var.Subnets
    min_size                   = var.ASGMinSize
    max_size                   = var.ASGMaxSize
    desired_capacity           = var.ASGDesiredCapacity
    health_check_grace_period  = var.ASGHelthCheckGracePeriod
    health_check_type          = var.ASGHelathCheckType
    target_group_arns          = [var.ALBTargetGroupARN]
}
