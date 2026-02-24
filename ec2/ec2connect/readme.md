# 1. 把 SSH 公鑰送到指定的 EC2 實例
aws ec2-instance-connect send-ssh-public-key \
  --instance-id i-033ee47a499a786a0 \
  --instance-os-user ec2-user \
  --availability-zone ca-central-1a \
  --ssh-public-key file://ec2connect.pub

# 2. 使用私鑰透過 SSH 登入 EC2
ssh -i ec2connect ec2-user@3.99.178.17


## chmod 400 ec2 ec2connect