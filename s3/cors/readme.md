# Create website 1

## Create a BUcket 
```sh
aws s3 mb s3://cors-ab-23132
```
## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-ab-23132 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```    
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-ab-23132 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-ab-23132 --website-configuration file://website.json
```
## Upload our index.html file and include a resourse that wold be cross-orign
aws s3 cp index.html s3://cors-ab-23132 

## View the webiste and see if the index.html is there
It this for ca-central-1
http://cors-ab-23132.s3-website.ca-central-1.amazonaws.com

Other region might use a hyphen
http://cors-ab-23132.s3-website-us-east-1.amazonaws.com

# Create website 2
```sh
aws s3 mb s3://cors-ab2-23132
```
## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-ab2-23132 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```    
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-ab2-23132 --policy file://bucket-policy2.json
```

## Turn on static websi hosting
```sh
aws s3api put-bucket-website --bucket cors-ab2-23132 --website-configuration file://website.json
```
## Upload our javascript file and include a resourse that wold be cross-orign

```sh
aws s3 cp hello.js s3://cors-ab2-23132 
```


## Apply a Cors policy

