## Create a new s3 bucket

```
aws s3 mb s3://checksums-example-ab-234234
```

## Create a file that will do a checksum on

```
echo "hello world" > myfile.txt
```
 
 ## GEt a checksum of a file for md5
 ## 1d94dd7dfd050410185a535b9575e184\
 ```md
 md5sum myfile.txt
 ```

 ## Upload my file and look at its etag
```
 aws s3 cp myfile.txt s3://checksums-example-ab-234234
 aws s3api head-object --bucket checksums-example-ab-234234 --key myfile.txt
```
## Upload file with different kind of checksum and change to base64
```sh
sudo apt install rhas
rhash --crc32 --simple myfile.txt
echo -n 25d4c8b7 | xxd -r -p | base64

```

```sh
aws s3api put-object \
--bucket="checksums-example-ab-234234" \
--body="myfile.txt" \
--key="myfilecrc32.txt" \
--checksum-algorithm="CRC32" \
--checksum-crc32="JdTItw=="
```