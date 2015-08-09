require 'rack'

class MyApp
  def call(env)
    [200, { "Content-Type" => "text/plain" }, ["Hello World"]]
  end
end

app = MyApp.new
app = Rack::ContentLength.new(app)
app = Rack::CommonLogger.new(app)

Rack::Server.start app: app, Port: 9292
