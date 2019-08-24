# DartSimple
Dart语法学习示例。

## 一、入口函数
> 与Java相似，都需要一个main函数作为应用入口
```$xslt
void main(){

}
```

## 二、常用基础数据类型

```$xslt
  num //数字类型
  String //字符串类型
  bool //布尔类型
  List //列表类型
  Map //键值对类型
  dynamic //动态类型
```

## 三、变量与常量

```$xslt
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
```
>输出
```$xslt
null
MrZhang
18
-------------------------------------------------------------------
打印数据：西瓜10
```
## 四、运算符与表达式

>大部分与java一致，在此略过。
```$xslt
  String a = "123";
  String b = "123";
  print(a == b); //与Java不同，这里==对比的不是引用
  int c;
  c ??= 10; //如果c为null，则会被赋值
  print(c);
  int d = 0;
  String e = d == 1 ? "Ros" : "Jack"; //三目运算符与java一致
  print(e);
  int f;
  int g = 66;
  int h = f ?? g; //如果??前为null将会使用后面的值
  print(h);
```
>输出

```$xslt
true
10
Jack
66
```
## 五、方法

```$xslt
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

```
>输出

```$xslt
15
5
13
姓名：小李,年龄：6,性别：null
姓名：小李,年龄：6,性别：1
姓名：小李,年龄：18,性别：1
姓名：小陈
姓名：小李,年龄：11,性别：null
姓名：小李,年龄：11,性别：0
```
## 六、类

```$xslt
main() {
  var person = Person(); //Dart中new关键字可以省略
  print(person.name);
  person.age = 18; //Dart类默认会生成get以及set方法
  print(person.age);
  print(person.sex); //final属性没有set，只有get
  person.toPrint();
  person(); //调用call方法
  var person2 = Person.instance("老谢");
  person2.toPrint(); //条件运算符，不为空才执行
  person2
    ..name = "老李"
    ..age = 48
    ..toPrint(); //级联操作
  Animal life = APerson();
  life.eat();
}

class Person {
  String name;
  int age;
  final int sex = 0;

  /**
   * 默认构造
   */
  Person() {}

  /**
   * 命名构造方法
   */
  Person.instance(String name) {
    this.name = name;
  }

  /**
   * 命名构造方法
   */
  Person._instances(this.name) : age = 16 {}

  /**
   * Dart中方法是不能重载的
   */
  toPrint() {
    print("$name-$age-$sex");
  }

  call() {
    print("Call:$name-$age-$sex");
  }
}

abstract class Animal {
  void eat() {
    print("eat");
  }
}

abstract class Life {
  Life(String alias) {
    print(alias);
  }

  void eat() {
    print("eat");
  }
}

class APerson extends Person with Animal {
  APerson() {}

  APerson.instance(String alias) : super() {
    print("APerson" + alias);
  }

  @override
  void eat() {
    super.eat();
  }

  @override
  toPrint() {
    return super.toPrint();
  }
}

/**
 * implements需要实现方法及变量
 */
class BPerson implements Person, Life {
  @override
  int age;
  @override
  String name;

  @override
  call() {
    return null;
  }

  @override
  void eat() {}

  @override
  int get sex => null;

  @override
  toPrint() {
    return null;
  }
}

```

>输出

```$xslt
null
18
0
null-18-0
Call:null-18-0
老谢-null-0
老李-48-0
eat
```