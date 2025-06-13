void main() {
  // 字符串的声明
  String str1 = 'Hello';
  String str2 = "World";
  String str3 = '''多行
字符串
示例''';

  // 字符串拼接
  String str4 = str1 + ' ' + str2;
  String str5 = '$str1 $str2!';

  // 字符串常用方法
  print(str1.length); // 输出字符串长度
  print(str2.toUpperCase()); // 转大写
  print(str2.toLowerCase()); // 转小写
  print(str3.contains('多行')); // 是否包含子串
  print(str4.replaceAll('World', 'Dart')); // 替换子串

  // 字符串分割
  String str6 = 'a,b,c';
  List<String> list = str6.split(',');
  print(list);

  // 字符串去空格
  String str7 = '  Dart  ';
  print(str7.trim());

  // 字符串转数字
  String numStr = '123';
  int num = int.parse(numStr);
  print(num + 1);

  // 数字转字符串
  int n = 456;
  String nStr = n.toString();
  print(nStr);

  // 判断字符串是否为空
  String emptyStr = '';
  print(emptyStr.isEmpty); // true

  // 获取字符串的运行时类型
  print(str1.runtimeType); // 输出 String
  print(numStr.runtimeType); // 输出 String
  print(nStr.runtimeType); // 输出 String

  //Dart字符串是UTF-16编码单元的序列。您可以使用单引号或双引号创建一个字符串:
  // 注意: Dart 中的字符串是不可变的，一旦创建就不能修改。每次对字符串进行修改操作，都会创建一个新的字符串对象。
  // 这意味着字符串的拼接、替换等操作会创建新的字符串，而不会修改原有字符串。

  var s1 = 'Hello, Dart!'; // 单引号字符串
  var s2 = "Hello, Dart!"; // 双引号字符串
  var s3 = '''Hello,
  Dart!'''; // 三引号字符串（多行字符串）
  var s4 = """Hello,
  Dart!"""; // 三引号字符串（多行字符串）
  print(s1);
  print(s2);
  print(s3);
  print(s4);
  // 3.拼接其他变量
  var name = 'Dart';
  var age = 10;
  var height = 1.75;
  print('Name: $name, Age: $age, Height: $height'); // 使用 $ 符号插入变量
}
