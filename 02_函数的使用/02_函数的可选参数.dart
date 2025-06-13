void main() {
  // 调用带位置可选参数的函数
  printInfo('张三');
  printInfo('李四', 18);
  printInfo('王五', 20, '北京');

  // 调用带命名可选参数的函数
  printPersonInfo('赵六');
  printPersonInfo('钱七', age: 22);
  printPersonInfo('孙八', city: '上海');
  printPersonInfo('周九', age: 25, city: '广州');

  // 调用带默认值的命名可选参数的函数
  printStudentInfo('刘十');
  printStudentInfo('陈十一', age: 19);
  printStudentInfo('黄十二', city: '深圳');

  // 调用必选参数和可选参数混合的函数
  introduce('小明', age: 16, hobby: '打篮球');
  introduce('小红', gender: '女');

  // 调用带required命名参数的函数
  var button1 = buildButton(text: '确定');
  print(button1);

  var button2 = buildButton(
    text: '取消',
    color: 'red',
    fontSize: 18.0,
    onPressed: () {
      print('按钮被点击');
    },
  );
  print(button2);
}

// 1. 位置可选参数：使用 [] 包裹
void printInfo(String name, [int? age, String? city]) {
  var ageStr = age != null ? '$age岁' : '年龄未知';
  var cityStr = city != null ? '来自$city' : '城市未知';
  print('位置可选参数 - 姓名：$name，$ageStr，$cityStr');
}

// 2. 命名可选参数：使用 {} 包裹
void printPersonInfo(String name, {int? age, String? city}) {
  var ageStr = age != null ? '$age岁' : '年龄未知';
  var cityStr = city != null ? '来自$city' : '城市未知';
  print('命名可选参数 - 姓名：$name，$ageStr，$cityStr');
}

// 3. 带默认值的命名可选参数
void printStudentInfo(String name, {int age = 20, String city = '未知城市'}) {
  print('默认值参数 - 姓名：$name，$age岁，来自$city');
}

// 4. 必选参数和可选参数混合
void introduce(String name, {String gender = '男', int? age, String? hobby}) {
  var ageInfo = age != null ? '$age岁' : '';
  var hobbyInfo = hobby != null ? '，爱好是$hobby' : '';
  print('$name，性别$gender$ageInfo$hobbyInfo');
}

// 5. 可选参数的常见用途 - 构建UI组件
String buildButton({
  required String text,
  String color = 'blue',
  double fontSize = 16.0,
  Function? onPressed,
}) {
  print('构建一个按钮：文本为"$text"，颜色是$color，字体大小是$fontSize');
  if (onPressed != null) {
    print('按钮已绑定点击事件');
  }
  return '这是一个按钮Widget';
}
