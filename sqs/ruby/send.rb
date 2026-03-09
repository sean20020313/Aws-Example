require 'aws-sdk-sqs' 


client = Aws::SQS::Client.new(
  region: 'us-east-1'   
)

queue_url = 'https://sqs.us-east-1.amazonaws.com/288761725991/MySQSQueue'

client.send_message({
  queue_url: queue_url,
  message_body: "Hello from Ruby SQS!"
})


resp = client.receive_message({
  queue_url: queue_url,
  max_number_of_messages: 1
})

resp.messages.each do |msg|
  puts "received message: #{msg.body}"

  client.delete_message({
    queue_url: queue_url,
    receipt_handle: msg.receipt_handle
  })
end
