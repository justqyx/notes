// 理解 inherit
// 基于原型的继承实现
//
// 注意点：
// 在实现继承后，各自的 constructor 变化

var Animal = function(){}
Animal.prototype.species = "动物";

var Cat = function(name, color){
  this.name = name;
  this.color = color;
}

var extend = function(child, parent){
  var F = function(){}
  F.prototype = Animal.prototype;
  child.prototype = new F;
  child.prototype.constructor = child;

  child.fn = child.prototype;

  child.fn.parent = child;
}

extend(Cat, Animal);

var smallCat = new Cat("Dudu", "Gray");

console.log("物种：" + smallCat.species);
console.log("名字：" + smallCat.name);
console.log("颜色：" + smallCat.color);
