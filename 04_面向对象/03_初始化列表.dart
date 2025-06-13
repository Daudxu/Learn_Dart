// Dart 类的初始化列表示例
void main() {
  // 创建点对象
  var p1 = Point(3, 4);
  print('点的坐标: ($p1.x, $p1.y)');
  print('到原点的距离: ${p1.distanceFromOrigin}');

  // 创建不可变点对象
  var p2 = ImmutablePoint(5, 12);
  print('不可变点的坐标: ($p2.x, $p2.y)');
  print('到原点的距离: ${p2.distanceFromOrigin}');

  // 使用默认颜色
  var circle1 = Circle(10);
  circle1.printInfo();

  // 指定颜色
  var circle2 = Circle(5, color: 'red');
  circle2.printInfo();

  // 使用断言的类
  var rectangle = Rectangle(4, 6);
  rectangle.printInfo();

  try {
    // 这将触发断言错误
    var invalidRectangle = Rectangle(-1, 3);
    invalidRectangle.printInfo(); // 这行不会执行
  } catch (e) {
    print('创建无效矩形时出错: $e');
  }

  // 使用转换参数的初始化列表
  var tempC = Temperature.celsius(25);
  print('摄氏温度: ${tempC.celsius}°C, 华氏温度: ${tempC.fahrenheit}°F');

  var tempF = Temperature.fahrenheit(77);
  print('摄氏温度: ${tempF.celsius}°C, 华氏温度: ${tempF.fahrenheit}°F');

  // 初始化私有变量
  var person = Person('张三', 20);
  print('${person.name}的ID是${person.id}，年龄是${person.age}岁');
}

// 基本点类，使用初始化列表计算距离
class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;

  // 使用初始化列表来计算距离
  Point(this.x, this.y) : distanceFromOrigin = sqrt(x * x + y * y);

  // 模拟 sqrt 函数
  static double sqrt(double value) {
    return value.sqrt();
  }
}

// 扩展 double 类型以添加 sqrt 方法
extension on double {
  double sqrt() {
    return this <= 0 ? 0 : _newton(this);
  }

  // 简化的牛顿迭代法计算平方根
  double _newton(double x) {
    double guess = x / 2;
    for (int i = 0; i < 10; i++) {
      guess = (guess + x / guess) / 2;
    }
    return guess;
  }
}

// 不可变点类
class ImmutablePoint {
  final double x;
  final double y;
  final double distanceFromOrigin;

  // 初始化列表中计算距离
  ImmutablePoint(this.x, this.y) : distanceFromOrigin = (x * x + y * y).sqrt();
}

// 带默认参数和初始化列表的类
class Circle {
  final double radius;
  final String color;
  final double area;
  final double circumference;

  // 构造函数使用初始化列表计算面积和周长
  Circle(this.radius, {this.color = 'blue'})
    : area = 3.14159 * radius * radius,
      circumference = 2 * 3.14159 * radius;

  void printInfo() {
    print('圆的半径: $radius, 颜色: $color');
    print('圆的面积: $area, 周长: $circumference');
  }
}

// 使用断言的类
class Rectangle {
  final double width;
  final double height;
  final double area;

  // 使用初始化列表中的断言确保宽度和高度为正值
  Rectangle(this.width, this.height)
    : assert(width >= 0, '宽度必须为非负数'),
      assert(height >= 0, '高度必须为非负数'),
      area = width * height;

  void printInfo() {
    print('矩形的宽度: $width, 高度: $height, 面积: $area');
  }
}

// 使用初始化列表进行参数转换的类
class Temperature {
  final double celsius; // 摄氏温度
  final double fahrenheit; // 华氏温度

  // 摄氏温度构造函数
  Temperature.celsius(this.celsius) : fahrenheit = celsius * 9 / 5 + 32;

  // 华氏温度构造函数
  Temperature.fahrenheit(this.fahrenheit) : celsius = (fahrenheit - 32) * 5 / 9;
}

// 初始化私有变量的类
class Person {
  final String name;
  final int age;
  final String _id; // 私有变量

  // 使用初始化列表设置私有变量
  Person(this.name, this.age)
    : _id = '${name.substring(0, 1)}${name.length}${age}';

  // getter 方法访问私有变量
  String get id => _id;
}
