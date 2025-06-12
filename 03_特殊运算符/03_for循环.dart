void main(List<String> args) {
  // 基本 for 循环
  for (var i = 0; i < 3; i++) {
    print('基本 for 循环 i: $i');
  }

  // for-in 循环，遍历集合
  List<String> names = ['Tom', 'Jerry', 'Spike'];
  for (var name in names) {
    print('for-in 循环 name: $name');
  }

  // forEach 方法遍历
  names.forEach((name) {
    print('forEach 遍历 name: $name');
  });

  // 倒序遍历
  for (var i = names.length - 1; i >= 0; i--) {
    print('倒序遍历 name: ${names[i]}');
  }
}
