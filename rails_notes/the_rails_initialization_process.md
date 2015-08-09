The Rails initialization process

理解 Rack 启动过程
---------------------------------

什么是 rack，怎么写 rack app?
  
  rack middleware 是一个拦截器

rack app 启动过程

  - parse options
  - build wrapped app
  - choose the best server and start run 'wrapped_app'

  __Rack::Server__
  __Rack::Hanlder__


理解 Rails 启动过程
---------------------------------

rails s (which rails)
railties/bin/rails

主要就是在 config/application.rb 里的 require 各个 rails 组件开始！！！！

什么是 Railtie
---------------------------------

  单例模式
  railtie 提供了一些勾子，用来扩展 Rails 或者介入到 Rails 的启动流程
  你可以定义一些 initializers 来添加一些初始化过程
  在 railtie 里，你可以访问 config 方法，它包含的配置项是被所有的 railties 和 Rails Applicatoin 所共享
  你还可以导入你的 rake tasks 和 generators

  初始化、修改配置、添加 rake 任务、添加 generator

  查看 rails 有多少个 railtie 可以用 Rails::Railtie.subclasses

什么是 Engine
---------------------------------

  一个迷你的 Rails，本质是一个 Rack App
