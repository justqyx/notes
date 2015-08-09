// ===================
// apply 和 call
// 用途: 函数调用
// apply 参数：上下文, 由参数组成的数组 => apply(context, arguments)
// call  参数: 上下文, 参数1, 参数2   => call(context, argument1, argument2, [argument3])
// ===================

var print = function(name){
  console.log(this);
  console.log(name);
}

print.apply(this, ["邱源鑫"]);
print.call(this, "邱源鑫");
