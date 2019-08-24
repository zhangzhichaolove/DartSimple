void main() {
  print(a(5, 10));
  print(b(2, 3));
  print(c(6, 7));
  d("小李");
  d("小李", sex: 1);
  d("小李", age: 18, sex: 1);
  var fun = (String name) => {print("姓名：$name")}; //方法对象
  var fun2 = a; //方法对象
  fun("小陈");
  fun2(6, 4);
  e("小李", 11);
  e("小李", 11, 0);
}

/**
 * 普通方法
 */
int a(int a, int b) {
  return a + b;
}

/**
 * 省略返回值类型以及参数类型
 */
b(a, b) {
  return a + b;
}

/**
 * 使用箭头语法替代表达式
 */
int c(a, b) => a + b;

/**
 * 可选参数
 */
d(String name, {int age = 6, int sex}) {
  print("姓名：$name,年龄：$age,性别：$sex");
}

/**
 * 基于位置的可选参数
 */
e(String name, [int age = 6, int sex]) {
  print("姓名：$name,年龄：$age,性别：$sex");
}
