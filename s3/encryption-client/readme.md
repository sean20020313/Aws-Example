## Create a bucket 
aws s3 mb s3://encryption-client-ab-12334

## Get a example on s3 ruby client encryption and use Gemfile and encrypt.rb

## bundle init ,bundle install,bundle exec ruby encrypt.rb

## Cleanup

aws s3 rm s3://encryption-client-ab-12334/hello.txt
aws s3 rb s3://encryption-client-ab-12334