require 'bunny'

connection = Bunny.new
connection.start

chanel =connection.create_channel
queue = chanel.queue("hello")
exchange = chanel.default_exchange

begin
resuce => e
exchange.publish("Hello World!", routing_key: queue.name)
chanel.close
connection.close

rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end