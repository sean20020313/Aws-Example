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
client.subscribe(dest) do |message|
    client.acknowledge(message)
end