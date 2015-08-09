## Dependencies of Rails

  Rails 是什么？

  * 一个 ruby gem
  * 一个 没有代码的 meta gem
  * 用于定义 Rails 依赖的组件

  Rails 包含的组件

  * ActiveSupport   对 Ruby 语言的一些扩展，Rails 的所有核心组件都是依赖于它
  * ActionPack      包含了Web请求逻辑，包含了MVC中的Controller和View
  * ActiveRecord    以 ActiveRecord 模式为基础的 ORM
  * ActionMailer    包含邮件发送和接收功能
  * Railites        将以上组件组合起来
  * sprockets-rails 是 Rails 的集成代码，为 Rails 带来了 Asset Pipeline
  * bundler         管理依赖 Rubygem 的版本

  各个组件还包含了其他一些依赖组件

  * builder         创建XML数据的DSL
  * rack            Ruby 的 Web Server 接口
  * rack-test       Rack 的测试框架
  * erubis          最快的 ERB 模板渲染引擎
  * arel            基于关系代数的 SQL 代码生成框架
  * rake & thor     命令行工具

  必要组件

  * ActiveSupport
  * ActionPack
  * Railites 

  可选组件

  * ActiveRecord    抽象出了 ActiveModel，以解耦?
  * ActionMailer    并不是所有程序都有邮件方面的需求，所以不需要
  * Asset Pipeline  Sprockets，并不是所有人都喜欢 Asset Pipeline
  * Test::Unit      其他任何测试框架都是 Test::Unit 的包装，添加了 Syntax Sugar

## 结合源码阅读

  Rails 以组件的形式来构造整个 Web Framework，真是太精彩了。

  除了一些核心的组件，其他组件都是可替代的，这个有助于扩展和自定义。

  因为之前对Rails的了解比新手要多一些，所以这篇文章看起来才比较轻松一些。

  接下来便是开始阅读源码了！干巴爹！

  已经按耐不住心中的激动了！！！
