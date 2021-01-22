require "socket"

puts "CLIENT APP LAUNCHED"

print "Username: "
$username = gets.chomp
if $username == ""
  $username = "Default Username"
end
puts ""
print "Server IP: "
$serverIP = gets.chomp
puts ""

s = TCPSocket.open($serverIP, 1234)

puts "Connected to server!"
puts "You may now chat."
puts "----------"
puts ""

readThread = Thread.new do#Read messages
  loop do
    #if s.gets != nil
      puts ">>>" + s.gets
      puts ""
    #end
  end
end

sendThread = Thread.new do#Send messages
  loop do
    message = gets
    message = $username + ": " + message
    s.puts message
    puts ""
  end
end

readThread.join
sendThread.join
