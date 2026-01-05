require 'aws-sdk-s3'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'ca-central-1'
puts "Bucket: #{bucket_name}"

client = Aws::S3::Client.new(region: region)

# 建立 bucket（如果已存在會丟錯誤）
begin
  client.create_bucket(
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region
    }
  )
  puts "Bucket created: #{bucket_name}"
rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket already exists and owned by you: #{bucket_name}"
rescue Aws::S3::Errors::BucketAlreadyExists
  puts "Bucket name already taken globally: #{bucket_name}"
end

# 隨機決定檔案數量 (1~6)
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

number_of_files.times do |i|
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # 建立檔案並寫入 UUID
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # 上傳檔案到 S3
  File.open(output_path, "rb") do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end

  puts "Uploaded: #{filename}"
end

puts "✅ All files uploaded successfully!"
