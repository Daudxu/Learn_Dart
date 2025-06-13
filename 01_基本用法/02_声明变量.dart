void main(List<String> args) {
  // string, int, double, bool, List, Map, Set
  // final, const, var
  // dynamic, Object, Null

  // 注意事项: 定义的变量可以修改值, 但是不能赋值其他类型
  String name = 'Dart';
  name = 'Flutter'; // 可以修改
  name = 'Dart'; // 可以再次修改
  int age = 10;
  double height = 1.75;

  print('Name: ${name}, Age: ${age}, Height: ${height}');

  var te = "hello";
  te = "world"; // 可以修改
  // te = 123; // 错误: var 只能赋值同类型的值
  print(te);
  print(name.runtimeType);

  //动态类型  但是在开发中, 通常情况下不使用dynamic, 因为类型的变量会带来潜在的危险 d
  dynamic dynamicVar = 'Hello';
  dynamicVar = 42; // 可以修改为其他类型
  print(dynamicVar);
  // final和const都是用于定义常量的, 也就是定义之后值都不可以修改
  final finalVar = 'Final Value'; // final 变量只能赋值一次
  // finalVar = 'New Value'; // 错误: final 变量不能修改
  print(finalVar);
  const constVar = 'Constant Value'; // const 变量在编译时就确定了
  // constVar = 'New Value'; // 错误: const 变量不能修改
  print(constVar);
  // final和const有什么区别呢?

  // const在赋值时, 赋值的内容必须是在编译期间就确定下来的

  // final在赋值时, 可以动态获取, 比如赋值一个函数
  // const constVar2 = getName(); // 错误: const 变量不能动态获取
  final constVar2 = getName(); // 正确: final 变量可以动态获取
  print(constVar2);

  // 首先, const是不可以赋值为DateTime.now()

  // 其次, final一旦被赋值后就有确定的结果, 不会再次赋值
  // const time = DateTime.now(); // 错误: const 变量不能动态获取
  final time = DateTime.now(); // 正确: final 变量可以动态获取
  print(time);

  //  const放在赋值语句的右边，可以共享对象，提高性能:

  const P1 = Person('Alicea');
  const P2 = Person('Alicea');
  print(identical(P1, P2));

  final a = const Person2();
  final b = const Person2();
  print(identical(a, b));

  final m = Person2();
  final n = Person2();
  print(identical(m, n));
}

String getName() {
  return 'Dart';
}

class Person {
  final String name;
  const Person(this.name);
}

class Person2 {
  const Person2();
}
