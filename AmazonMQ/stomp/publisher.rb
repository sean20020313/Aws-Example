require 'stomp'

login =''
passcode = ''
host = ''
port = ''


client = Stomp::Client.new({
    host: [
        login: login,
        passcode: passcode,
        host: host,
        port: port,
        ssl: false  
    ]
})
client = Stomp::Client.new(config)
destination = '/topic/test'
client.publish(destination, 'Hello, STOMP!')
client.close