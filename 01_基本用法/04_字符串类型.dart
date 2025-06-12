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
}
