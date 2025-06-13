// Dart 类的定义示例
void main() {
  // 创建类的实例（对象）
  var p1 = Person();
  p1.name = '张三';
  p1.age = 20;
  p1.sayHello();
  p1.introduce();

  // 另一种创建实例的方式，使用 new 关键字（可选的）
  var p2 = new Person();
  p2.name = '李四';
  p2.age = 25;
  p2.sayHello();
  p2.introduce();

  // 使用类的静态属性和方法
  print('人类的平均寿命：${Person.averageLifeExpectancy}年');
  Person.printPopulation();

  // 创建矩形对象
  var rect = Rectangle();
  rect.width = 10;
  rect.height = 5;
  print('矩形面积：${rect.calculateArea()}');

  // 创建学生对象
  var student = Student();
  student.name = '王五';
  student.age = 18;
  student.grade = '高三';
  student.study();
  student.introduce();
}

// 定义一个类
class Person {
  // 实例属性 - 定义对象的特征
  String name = '';
  int age = 0;

  // 静态属性 - 属于类本身而非实例
  static int averageLifeExpectancy = 73;
  static int population = 0;

  // 构造函数（将在后续文件中详细讲解）
  Person() {
    population++; // 创建新实例时增加人口计数
  }

  // 实例方法 - 定义对象的行为
  void sayHello() {
    print('$name 说：你好！');
  }

  void introduce() {
    print('我是 $name，今年 $age 岁。');
  }

  // 静态方法 - 属于类本身而非实例
  static void printPopulation() {
    print('当前人口总数：$population');
  }
}

// 定义一个矩形类
class Rectangle {
  // 矩形的属性
  double width = 0;
  double height = 0;

  // 计算矩形面积的方法
  double calculateArea() {
    return width * height;
  }

  // 计算矩形周长的方法
  double calculatePerimeter() {
    return 2 * (width + height);
  }
}

// 定义一个学生类
class Student {
  // 学生的属性
  String name = '';
  int age = 0;
  String grade = '';

  // 学生的方法
  void study() {
    print('$name 正在学习中...');
  }

  void introduce() {
    print('我是 $name，今年 $age 岁，就读于 $grade。');
  }
}
