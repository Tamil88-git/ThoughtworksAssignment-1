resource "aws_efs_file_system" "Efs" {
    creation_token = var.EfsToken
    encrypted      = "true"
    kms_key_id     = var.KMSKeyId
    tags = {
        Name 	   = var.EfsTagName
    }
}

resource "aws_efs_mount_target" "EfsMountTarget_1" {
    file_system_id  = aws_efs_file_system.Efs.id
    subnet_id       = var.Subnet_1
    security_groups = [var.SecurityGroupId]
}

resource "aws_efs_mount_target" "EfsMountTarget_2" {
    file_system_id  = aws_efs_file_system.Efs.id
    subnet_id       = var.Subnet_2
    security_groups = [var.SecurityGroupId]
}
