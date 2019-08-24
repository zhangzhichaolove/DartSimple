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
