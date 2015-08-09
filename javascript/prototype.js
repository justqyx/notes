// 理解 prototype
// 初衷: 用于存储各个实例对象公用的属性和行为，还应用于 inherit
//
// 注意点：
// 实例对象在访问属性或方法时，其查找顺序

var Animal = function(sound){
  this.sound = sound;
}

Animal.prototype.public_name = "动物";

Animal.prototype.belongs_to = function(){
  console.log(this.public_name);
}

var cat = new Animal("喵喵");
var dog = new Animal("旺旺");

cat.belongs_to(); // => 动物
dog.belongs_to(); // => 动物

cat.belongs_to = function(){
  console.log("啦啦啦啦");
};

cat.belongs_to(); // => 啦啦啦啦
dog.belongs_to(); // => 动物
