require 'socket'

Socket.tcp("127.0.0.1", 4481) do |connection|
  connection.write "GET / HTTP/1.1\r\n"

  data = connection.read
  puts "=== This is what I read ==="
  puts data

  connection.close
end

