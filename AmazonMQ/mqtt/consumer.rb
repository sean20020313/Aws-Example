require 'mqtt'

host = 'localhost'
topic = 'test/topic'
message = 'Hello, MQTT!'

begin
    MQTT::Client.connect(host) do |client|
        client.get(topic) do |topic, message|
        puts message
        puts topic
    end
rescue => e 
   puts e.inspect
end