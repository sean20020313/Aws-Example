## Create a user with no permissions

we need to create a new user with no permissions and gernerate out access keys
```sh
aws iam create-user --user-name sts-machine-user

aws iam create-access-key --user-name sts-machine-user --output table

```

then edit crendential file to change away from default profile



Copy the access key and secret here 
```sh
aws configure
```

Test who you are
```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```
cat ~/.aws/credentials
vim  ~/.aws/credentials

make sure you don't have access to s3
```sh
aws s3 ls --porfile sts
```

## Create a Role

we need to create a role that will access a new resource

```sh
chmod u+x bin/deploy
```

## Use new user crednetial and assum role
```sh
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
    --role-arn arn:aws:iam::288761725991:role/my-sts-fun-stack-StsRole-2fpQbhHXugxO \
    --role-session-name s3-sts-fun \
    --profile sts
```
git push origin main



```sh
aws sts get-caller-identity --profile sts
```

## cleanup

tear down cfn stack via the aws manager console

```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
```

```sh
aws iam delete-access-key --access-key-id AKIAUGO4KIQTVKDZJ6KV \
--user-name sts-machine-user 
```

```sh
aws iam delete-user --user-name sts-machine-user
```