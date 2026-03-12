require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue("hello")

begin
    queue.subscribe(block: true) do |delivery_info, properties, body|
        puts body
    end
rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end