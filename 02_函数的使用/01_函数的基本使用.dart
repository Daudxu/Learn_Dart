// 返回值 函数的名称(参数列表) {
//   函数体
//   return 返回值
// }

var name = 'global';
void main(List<String> args) {
  // 命名可选参数
  // 命名可选参数: {param1, param2, ...}
  // 位置可选参数: [param1, param2, ...]

  printInfo1(String name, {int? age, double? height}) {
    print('name=$name age=$age height=$height');
  }

  // 调用printInfo1函数
  printInfo1('why'); // name=why age=null height=null
  printInfo1('why', age: 18); // name=why age=18 height=null
  printInfo1('why', age: 18, height: 1.88); // name=why age=18 height=1.88
  printInfo1('why', height: 1.88); // name=why age=null height=1.88

  // 参数的默认值
  printInfo4(String name, {int age = 18, double height = 1.88}) {
    print('name=$name age=$age height=$height');
  }

  printInfo4('why'); // name=why age=18 height=1.88
  printInfo4('why', age: 20); // name=why age=20 height=1.88

  // 1.将函数赋值给一个变量
  var bar = foo;
  print(bar);

  // 2.将函数作为另一个函数的参数
  test(foo);

  // 3.将函数作为另一个函数的返回值
  var func = getFunc();
  func('kobe');

  // 1.定义数组
  var movies = ['盗梦空间', '星际穿越', '少年派', '大话西游'];

  // 2.使用forEach遍历: 有名字的函数
  printElement(item) {
    print(item);
  }

  movies.forEach(printElement);

  // 3.使用forEach遍历: 匿名函数
  movies.forEach((item) {
    print(item);
  });
  movies.forEach((item) => print(item));

  print(fooOptional()); // null

  makeAdder(num addBy) {
    return (num i) {
      return i + addBy;
    };
  }

  var adder2 = makeAdder(2);
  print(adder2(10)); // 12
  print(adder2(6)); // 8

  var adder5 = makeAdder(5);
  print(adder5(10)); // 15
  print(adder5(6)); // 11
}

// 1.定义一个函数
foo(String name) {
  print('传入的name:$name');
}

// 2.将函数作为另外一个函数的参数
test(Function func) {
  func('coderwhy');
}

// 3.将函数作为另一个函数的返回值
getFunc() {
  return foo;
}

// 位置可选参数

fooOptional() {
  print('foo function');
}
