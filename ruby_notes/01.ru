my_app = lambda do |env|
  header = {
    "Content-Type" => "text/plain",
    "foo" => "bar"
  }

  [200, header, ["Hello World, Ruby."]]
end

# Rack::Builder
use Rack::ContentLength
use Rack::CommonLogger

# my_app 是一个 lambda，所以其有一个 call 方法
# 如：my_app.call(env)
run my_app
