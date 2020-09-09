#!/bin/bash
sudo su - root
log="/tmp/userdataoutput.log"
touch $log
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config 
[ $? != 0 ] && echo "Problem enabling password authentication" || echo "Password enabled done" >> $log
service sshd restart 
yum install httpd -y 
echo "This is created from Terraform" > /var/www/html/index.html               
service httpd start 
yum update -y
echo "Wiki:Wiki" |chpasswd 
[ $? != 0 ] && echo "Unable to change password for Wiki" || echo "Password set for Wiki" >> $log
echo "Wiki        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers 
[ $? != 0 ] && echo "Problem in writing sudoers file" || echo "sudoers file modified" >> $log
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNn/UR0jb/w7E6zdNdWTLk2sSg7a9fNPT0claRheYOABUzKLA0W0Gnh3vjDTesSsh8SYYGCIjp4L1brUUoUVgE//TZowz9F3wlUGtNiG36aXpu594PUvcbA5TB7cE1iR3WX1kncCEqioFX5AE6LQn0Zj29qdIDkwF1lwFGGKPCbXlMW90r1yC/2vPu/4SWO9KqiMBqSBKo28PBUEMnzq/67qkJ0b83Cryzi7d84q/+ytD94OKDO+Hbe56TNsETCHmpG2O5ZPq0kAX9QBqes9eVaBonXnKquSvnfDoLISn/ThXoBNSzbDewwSaie2yszisYylaChqcGv+j3ohCWTx0J" >>/home/Wiki/.ssh/authorized_keys
[ $? != 0 ] && echo "Problem adding key" || echo "Wiki key added" >> $log
echo "/opt mounting is started" >> $log
mkfs.ext4 -E nodiscard /dev/nvme0n1
mount -o discard /dev/nvme0n1 /opt
echo "/dev/nvme0n1 /opt ext4 defaults,nofail,discard 0 2" >>/etc/fstab
echo "/opt mounting is completed" >> $log
yum install -y nfs-utils  
[ $? != 0 ] && echo "Problem installing nfs-utils package" || echo "installed nfs-utils package">> $log
mkdir /shareems  
efs_dnsname="${EfsDNSName}"  
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $efs_dnsname:/ /shareems
[ $? != 0 ] && echo "EFS mounitng problem" || echo "EFS mounted /shareems succesfully" >> $log

#mkfs -t ext4 /dev/xvdb >> $log
#[ $? -eq "0" ] && echo "file system created"
#mount /dev/xvdb /opt  >> $log
#[ $? -eq "0" ] && echo "Mounitng created created"
