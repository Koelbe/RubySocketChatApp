require "socket"

puts "SERVER APP LAUNCHED"

print "Username: "
$username = gets.chomp
if $username == ""
  $username = "Default Username"
end
puts ""

$server = TCPServer.open 1234
puts "Server started, waiting for client..."
$client = $server.accept
puts "Client joined!"
puts "You may now chat."
puts "----------"
puts ""
recieveThread = Thread.new do##Recieve messages
  loop do
    #if $client.gets != nil
      puts ">>>" + $client.gets
      puts ""
    #end
  end
end

sendThread = Thread.new do##Send messages
  loop do
    message = gets
    message = $username + ": " + message
    $client.puts message
    puts ""
  end
end

recieveThread.join
sendThread.join
