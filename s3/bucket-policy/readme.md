## create a bucket 
```sh
aws s3 mb s3://bucket-simple-policy
```

## create bucket policy

aws s3api put-bucket-policy --bucket bucket-simple-policy --policy file://policy.json


## access bucket from other account
```sh
touch file.txt
aws s3 cp file.txt s3://bucket-simple-policy
aws s3 ls s3://bucket-simple-policy
``` 
## cleanup 
```sh
aws s3 rm s3://bucket-simple-policy/file.txt
aws s3 rb s3://bucket-simple-policy
```
