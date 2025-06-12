void main() {
  // Dart 中只有 true 才为真，其他（如 0、null、空字符串）都不是 true
  var a = 0;
  var b = 1;
  var c = '';
  var d = null;
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

  if (e) {
    print('e 为真');
  } else {
    print('e 为假');
  }

  // 直接用数字、字符串、null 判断会报错
  // if (a) {} // 错误写法
  // if (c) {} // 错误写法
}
