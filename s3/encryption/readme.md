## Cretate a bucket 

aws s3api create-bucket --bucket encryption-ab-1232234 --region us-east-1

### Create a file and put object with encryption SSE-S3

echo "hello world!!" > hello.txt
aws s3 cp hello.txt s3://encryption-ab-12345


592d9833-4152-4670-834d-120fe4261b35
### Put object with encryption of kms

aws s3api put-object \
  --bucket encryption-ab-1232234 \
  --key hello.txt \
  --body hello.txt \
  --server-side-encryption aws:kms \
  --ssekms-key-id 592d9833-4152-4670-834d-120fe4261b35 \
  --region us-east-1


### Put Object with SEE-C (failed attempt)

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY
### 解碼 → 計算 MD5 → 再轉 Base64
echo -n $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64

export MD5_VALUE=$(echo  $BASE64_ENCODED_KEY  | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE

aws s3api put-object \ 
  --bucket encryption-ab-1232234 \
  --key hello.txt \
  --body hello.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key $BASE64_ENCODED_KEY \
  --sse-customer--key-md5 $MD5_VALUE


### Put object with SSE-C via aws s3

 openssl rand -out ssec.key 32



aws s3 cp hello.txt s3://encryption-ab-1232234/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key


aws s3 cp s3://encryption-ab-1232234/hello.txt hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key