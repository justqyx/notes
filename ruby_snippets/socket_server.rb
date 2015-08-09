require 'socket'
require 'pry'
require 'pry-nav'

# This socket will bind to the loopback interface,
# and only be listening for clients from localhost.

#local_socket = Socket.new :INET, :STREAM
#local_addr   = Socket.pack_sockaddr_in 4481, "127.0.0.1"
#local_socket.bind local_addr

# This socket will bind to any of the known interfaces,
# and will be listening for any client that can route messages to it.
#any_socket = Socket.new :INET, :STREAM
#any_addr   = Socket.pack_sockaddr_in 4481, "0.0.0.0"
#any_socket.bind any_addr

## 并发 5 个
#any_socket.listen 5

#loop do
  #client, addr_info = any_socket.accept

  #puts "  Connection class:  #{client.class}"
  #puts "      Server filno:  #{any_socket.fileno}"
  #puts " Connection fileno:  #{client.fileno}"
  #puts "     Local address:  #{client.local_address.inspect}"
  #puts "    Remote address:  #{client.remote_address.inspect}"

  #client.close
#end

# This scoket attempts to bind an unknow interface
# and raises Errno::EADDRNOTAVAIL
#error_socket = Socket.new :INET, :STREAM
#error_addr   = Socket.pack_sockaddr_in 4481, "1.2.3.4"
#error_socket.bind error_addr

#servers = Socket.tcp_server_sockets 4481

#Socket.accept_loop(servers) do |connection|
  #puts "  Connection class:  #{connection.class}"
  #puts " Connection fileno:  #{connection.fileno}"
  #puts "     Local address:  #{connection.local_address.inspect}"
  #puts "    Remote address:  #{connection.remote_address.inspect}"
  #puts "========================================================="

  #connection.close
#end

# 最终版，直接监听某个端口的 Sockets
Socket.tcp_server_loop(4481) do |connection|
  # Tips
  # 既然在 unix 下，所有的东西都是文件，那么在 ruby 里，你就可以使用 File 对象的方法

  # puts connection.read
  # 如果客户端的数据很大，那你就惨了

  #while data = connection.read(1024) do
    #puts data
  #end
  # 如果客户端发送的数据超过 1kb，则自动断掉
  # 如果不足 1kb，那么就会继续等，直到 1kb 数据到了又或者是客户端主动断开连接

  begin
    while data = connection.readpartial(1024) do
      puts data
    end
  rescue EOFError
  end
  # 这个更加智能，如果客户端发送不足 1kb，那么马上就会结束，并返回数据

  puts "==" * 50
  connection.close
end

