class Person {
  String name = '';
  int age = 0;

  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }

  void showInfo() {
    print('姓名: $name, 年龄: $age');
  }
}

void main() {
  // 普通写法
  var p1 = Person();
  p1.setName('Tom');
  p1.setAge(20);
  p1.showInfo();

  // 级联运算符写法（..）
  var p2 = Person()
    ..setName('Jerry')
    ..setAge(18)
    ..showInfo();

  // 级联运算符还可以连续访问属性
  var p3 = Person()
    ..name = 'Spike'
    ..age = 25
    ..showInfo();
}
