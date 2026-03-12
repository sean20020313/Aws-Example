require 'mqtt'

host = 'localhost'
topic = 'test/topic'
message = 'Hello, MQTT!'

begin
    MQTT::Client.connect(host) do |client|
        client.publish(topic, message)
    end
rescue => e 
   puts e.inspect
end