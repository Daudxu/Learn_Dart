class Person {
  // 私有属性，以下划线开头
  String? _name;
  int? _age;
  double? _height;

  // name 属性的 getter
  String? get name => _name;

  // name 属性的 setter，带有验证逻辑
  set name(String? value) {
    if (value != null && value.isNotEmpty) {
      _name = value;
    } else {
      print("名字不能为空");
    }
  }

  // age 属性的 getter
  int? get age => _age;

  // age 属性的 setter，带有验证逻辑
  set age(int? value) {
    if (value != null && value >= 0 && value <= 120) {
      _age = value;
    } else {
      print("年龄必须在 0-120 之间");
    }
  }

  // height 属性的 getter
  double? get height => _height;

  // height 属性的 setter，带有验证逻辑
  set height(double? value) {
    if (value != null && value > 0) {
      _height = value;
    } else {
      print("身高必须大于 0");
    }
  }

  // 只读属性 - 只有 getter 没有 setter
  String get info => "姓名: $_name, 年龄: $_age, 身高: $_height";

  // 计算属性 - 基于其他属性计算而来
  bool get isAdult => _age != null && _age! >= 18;
}

void main(List<String> args) {
  var p = Person();

  // 设置属性
  p.name = "张三";
  p.age = 20;
  p.height = 175.5;

  // 获取属性
  print("姓名: ${p.name}");
  print("年龄: ${p.age}");
  print("身高: ${p.height}");

  // 测试验证逻辑
  p.name = ""; // 输出: 名字不能为空
  p.age = 150; // 输出: 年龄必须在 0-120 之间
  p.height = -10; // 输出: 身高必须大于 0

  // 测试只读属性和计算属性
  print("信息: ${p.info}");
  print("是否成年: ${p.isAdult}");
}
