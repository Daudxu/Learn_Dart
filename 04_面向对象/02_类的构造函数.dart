// Dart 类的构造函数示例
void main() {
  // 使用默认构造函数创建对象
  var p1 = Person('张三', 20);
  p1.introduce();

  // 使用命名构造函数创建对象
  var p2 = Person.withNameOnly('李四');
  p2.introduce();

  var p3 = Person.withAgeOnly(25);
  p3.introduce();

  var p4 = Person.guest();
  p4.introduce();

  // 使用参数构造函数的默认参数
  var p5 = Person.withDefault('王五');
  p5.introduce();

  // 使用位置参数和命名参数混合的构造函数
  var s1 = Student('赵六', age: 18, grade: '高三');
  s1.introduce();

  // 使用多重构造函数的类
  var r1 = Rectangle(10, 5);
  print('矩形面积: ${r1.area}');

  var r2 = Rectangle.square(6);
  print('正方形面积: ${r2.area}');

  var r3 = Rectangle.fromPoints(Point(0, 0), Point(8, 4));
  print('从点创建的矩形面积: ${r3.area}');
}

// 定义 Person 类展示各种构造函数
class Person {
  String name;
  int age;

  // 基本构造函数
  Person(this.name, this.age);

  // 命名构造函数，只接收名字
  Person.withNameOnly(this.name) : age = 0;

  // 命名构造函数，只接收年龄
  Person.withAgeOnly(this.age) : name = '未知';

  // 命名构造函数，无需参数
  Person.guest() : name = '访客', age = 0;

  // 带默认参数的构造函数
  Person.withDefault(this.name, {this.age = 18});

  // 实例方法
  void introduce() {
    print('我是 $name，今年 $age 岁。');
  }
}

// 定义 Student 类，展示位置参数和命名参数混合
class Student {
  String name;
  int age;
  String grade;

  // 构造函数：第一个是位置参数，后面是命名参数
  Student(this.name, {required this.age, this.grade = '未知'});

  void introduce() {
    print('我是 $name，今年 $age 岁，就读于 $grade。');
  }
}

// 定义辅助点类
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

// 定义 Rectangle 类，展示多种构造函数
class Rectangle {
  double width;
  double height;

  // 基本构造函数
  Rectangle(this.width, this.height);

  // 创建正方形的命名构造函数
  Rectangle.square(double side) : width = side, height = side;

  // 从两点创建的命名构造函数
  Rectangle.fromPoints(Point p1, Point p2)
    : width = (p2.x - p1.x).abs(),
      height = (p2.y - p1.y).abs();

  // 计算面积的 getter
  double get area => width * height;

  // 计算周长的 getter
  double get perimeter => 2 * (width + height);
}
