## Get VPC ID
```sh
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=nacl-example-vpc" \
--query "Vpcs[].VpcId" \
--output text
```
acl-04a0fa0b8633b082d

## NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-0534fbc1dae0cb378
```

## Get AMI for Aws Linux 2
Amazon Linux 2023 AMI 2023.10.20260120.4 x86_64 HVM kernel-6.1

Gab the latest AML2 AMI
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region ca-central-1 \
--output text

```
ami-020ce4ade5046b3ed