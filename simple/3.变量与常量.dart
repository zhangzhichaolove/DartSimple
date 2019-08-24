void main() {
  var name; //用var声明一个变量
  print(name); //未被赋值时，默认为null
  name = "MrZhang"; //赋值为字符串
  print(name);
  name = 18; //赋值为数字
  print(name);
  print("-------------------------------------------------------------------");
  final age = 10; //使用final声明的变量只能被赋值一次
  //age = 20;// 'age', a final variable, can only be set once
  const like = "西瓜"; //使用const声明的属于常量只能被赋值一次
  //like = "香蕉";//error: Constant variables can't be assigned a value.
  print("打印数据：${like + age.toString()}"); //
}
