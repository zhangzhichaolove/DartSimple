void main() {
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
}
