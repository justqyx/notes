Rails 是一个 Web 框架，也叫 Ruby on Rails。

1、Rails::Railtie

Railtie 是 Rails 框架的核心，它实现了 initialization and configuration。
它通过提供一些 hooks 来使得你能够扩展 Rails 或是参与到 Rails 的初始化过程。

Rails 每一个主要的组件（Action Mailer, Action Controller, Action View and Active Record）都是一个 Railtie。
他们负责各自的初始化工作。
这样使得 Rails 本身可以去除任何一个组件，因为他们都是独立的。
所以我们可以用其他组件来替代 Rails 默认的组件， 如(Mongoid 替代 Active Record)。

开发一个 Rails extension 并不需要实现 Railtie，
但是如果你需要参与到 Rails 框架的启动或者是启动后的过程，则是需要实现 Railtie 的。

== Create your Railtie

```ruby
module MyGem
  class Railtie < Rails::Railtie
  end
end
```

== Rails::Railtie 主要实现了 initializable 和 configuration。

initializable 模块，负责 Rails 的初始化工作。

```ruby
class MyRailtie < Rails::Railtie
  initializer "my_railtie.config_rails_initialization" do
    # Some initialization behavior 
  end
  
  initializer "my_railtie.config_rails_initialization" do |app|
    # app.middleware.use MyRailtie::Middleware 
  end
end
```

configuration 模块，实现了配置参数属性的访问和设置。

```ruby
class MyRailtie < Rails::Railtie
  app.generators.orm :my_railtie_orm
  config.to_prepare do
    MyRailtie.setup!
  end
end
```

== Loading rake tasks and generators

If your railtie has rake tasks, you can tell Rails to load them through the method
rake tasks:

```ruby
class MyRailtie < Rails::Railtie
  rake_tasks do
    load "path/to/my_railtie_tasks"
  end
end
```

By default, Rails load generators from your load path. However, if you wanto to place
your generators at a different location, you can specify in your Railtie a block which
will load them during normal generators lookup:

```ruby
class MyRailtie < Rails::Railtie
  generators do
    require "path/to/my_railtie_generator"
  end
end
```

2、Rails::Engine

Rails::Engine 跟 Rails::Railtie 是一样的，但是多了一些 configuration 和 initializers。

== Create an Engine
== Configuration
== Generators
== Paths
== Endpoint ? routes ?

Soga，an engine also can be an rack application. It can be useful
if you have a rack application that you would like to wrap with
+Engine+ and provides some of the +Engine+ features.

```ruby
module MyEngine
  class Engine < ::Rails::Engine
    endpoint MyRackApplication
  end
end
```

Now you can mount your engine in application's routes just like that:

```ruby
Rails.application.routes.draw do
  mount MyEngine::Engine => "/engine"
end
```

== Middleware stack
== Routes（如果不指定 endpoint，那么 routes 会成为默认的 endpoint）
== Mout priority


3、Rails::Application

Rails::Application 跟 Rails::Engine 基本是一样的，它负责协调整个启动过程。

[Initialization] 

Rails::Application 负责执行所有 railties 和 engines 的 initilizers。
同时执行一些 bootstrap initializers 和 finishing initializers，
在上面这些都执行完毕之后，还有 check Rails::Application::Finisher。

[Configuration] 

除了提供一些来自 Rails::Engine 和 Rails::Railtie 的一些配置，Rails::Application
还拥有几个特定的配置，例如：'cache_classes'、'consider_all_requests_local'、
'filter_paramters' 和 'logger' 等。

[Routes]

Rails::Application 还负责 holding the routes 和 在devement环境下，当文件改变时去 reload routes。

[Middleware]

Rails::Application 还负责建立 the middleware stack。

[Booting process]

1)  require 'config/boot.rb' to setup load paths   (目的是把所有的gem文件 require 进来)
2)  require railties and engnies
3)  define Rails.applicaton as 'class MyApp::Application < Rails::Application'
4)  运行 config.before_configuration 回调
5)  加载 config/environments/ENV.rb
6)  运行 config.before_initialize 回调
7)  One by One, run Railtie#initializer defined by railties, engines and application
8)  运行 自定义的 Railtie#initializer defined by railties, engines and application
9)  建立 middleware stack 并且 run to_prepare callbacks（???）
10) 运行 config.before_eager_load and eager_load! if eager is true
11) 运行 config.after_initialize 回调 (这里可能就是做一些检查工作)



