void main(List<String> args) {
  // string, int, double, bool, List, Map, Set
  // final, const, var
  // dynamic, Object, Null

  // 声明变量
  String name = 'Dart';
  int age = 10;
  double height = 1.75;

  // print(name);
  // print(age);
  // print(height);
  const P1 = Person('Alicea');
  const P2 = Person('Alice');
  print(identical(P1, P2));
}

class Person {
  final String name;
  const Person(this.name);
  // void introduce() {
  //   print('My name is $name and I am $age years old.');
  // }
}
