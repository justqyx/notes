// Javascript 虚拟实现 Class
// class 为 javascript 保留的关键字

var Class = function(){
  var klass = function(){
    this.init.apply(this, arguments);
  }

  klass.prototype.init = function() {}

  klass.fn = klass.prototype

  klass.fn.parent = klass;

  klass.fn.say = function(){
    console.log("Hello World!");
  }

  // 注意，返回的是一个构造函数
  return klass;
}

// 注意 new Class，在这里相当于执行了一遍 Class()，所以 Person 是一个 klass 的构造函数
var Person = new Class;

// 覆盖 klass 里的 say 函数
Person.fn.say = function(){
  console.log("Not Hello World!")
}

// 所以需要 new Person 之后才能访问 klass.fn 里的属性或行为
var p = new Person();
p.say();
