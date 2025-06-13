void main() {
  // Dart 中只有 true 才为真，其他（如 0、null、空字符串）都不是 true
  var a = 0;
  var b = 1;
  var c = '';
  Object? d = null;
  var e = false;

  if (a != 0) {
    print('a 非零为真');
  } else {
    print('a 为零，不为真');
  }

  if (b != 0) {
    print('b 非零为真');
  } else {
    print('b 为零，不为真');
  }

  if (c.isNotEmpty) {
    print('c 非空字符串为真');
  } else {
    print('c 是空字符串，不为真');
  }

  if (d != null) {
    print('d 非 null 为真');
  } else {
    print('d 是 null，不为真');
  }

  // if (e == true) {
  if (e) {
    print('e 为真');
  } else {
    print('e 为假');
  }

  // 直接用数字、字符串、null 判断会报错
  // if (a) {} // 错误写法
  // if (c) {} // 错误写法

  // 整数int
  int age = 10;
  int hexAge = 0xA; // 十六进制
  print(age); // 输出 10
  print(hexAge); // 输出 10
  // 浮点类型
  double height = 1.75;
  print(height);

  // 字符串和数字之间的转化:

  // 字符串和数字转化
  // 1.字符串转数字
  var one = int.parse("111");
  var two = double.parse("1.1111");
  print('字符串转数字: $one, ${one.runtimeType}, $two, ${two.runtimeType}');
  // 2.数字转字符串
  var num1 = 123;
  var num2 = 456.78;
  var numStr1 = num1.toString();
  var numStr2 = num2.toString(); // 保留两位小数
  var numStr3 = num2.toStringAsFixed(2);
  print(
    '数字转字符串: $numStr1, ${numStr1.runtimeType}, $numStr2, ${numStr2.runtimeType}, $numStr3, ${numStr3.runtimeType}',
  );

  //布尔类型中,Dart提供了一个bool的类型, 取值为true和false
  var isFlag = true; // 布尔类型;
  print('布尔类型: $isFlag, ${isFlag.runtimeType}');
  //Dart中不能判断非0即真, 或者非空即真
  if (isFlag == true) {
    print('isFlag 为真');
  } else {
    print('isFlag 为假');
  }
}
