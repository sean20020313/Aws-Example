## Create a bucket 
```sh
aws s3api create-bucket --bucket acl-example-ab-123456 --region us-east-1
```

## Turn of block public access for acls
```sh
aws s3api put-public-access-block \
    --bucket acl-example-ab-123456  \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-ab-123456  
```

## change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-ab-123456  \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

```

## access bucket from other account
```sh
touch file.txt
aws s3 cp file.txt s3://acl-example-ab-123456 
aws s3 ls s3://acl-example-ab-123456 
``` 

## cleanup 
```sh
aws s3 rm s3://acl-example-ab-123456/file.txt
aws s3 rb s3://acl-example-ab-123456
```