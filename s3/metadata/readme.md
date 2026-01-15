# Create a bucket

aws s3 mb s3://metadata-fun-ab-1111

### Create a new file

echo "hello sean" > hello.txt

## upload file with meatadata
aws s3api put-object --bucket metadata-fun-ab-1111 --key hello.txt --body hello.txt --metadata planet=sean

## Get Metadata through head object

aws s3api head-object --bucket metadata-fun-ab-1111 --key hello.txt