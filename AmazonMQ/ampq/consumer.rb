require 'bunny'

config = {
    host: '/',
    username: 'admin',
    password: '000000',
    virtual_host: 'myapp.production',
    port: 5672,
    ssl: false
}

b = Bunny.new("amqp://guest:guest@localhost:5672")

connection = Bunny.new(*config)
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