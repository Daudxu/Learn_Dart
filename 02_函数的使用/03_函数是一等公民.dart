// 定义一个带 call 方法的类
class Adder {
  int x;
  Adder(this.x);

  int call(int y) {
    return x + y;
  }
}

void printHello() {
  print('Hello');
}

int add(int a, int b) {
  return a + b;
}

void main() {
  // 函数可以赋值给变量
  var fn = printHello;
  fn();

  // 函数可以作为参数传递
  void execute(Function func) {
    func();
  }

  execute(printHello);

  // 匿名函数赋值
  var sum = add;
  print('sum(2, 3): ${sum(2, 3)}');

  // 匿名函数作为参数
  List<int> numbers = [1, 2, 3];
  numbers.forEach((item) {
    print('item: $item');
  });

  // 函数可以作为返回值
  Function makeAdder(int x) {
    return (int y) => x + y;
  }

  var add2 = makeAdder(2);
  print('add2(5): ${add2(5)}');

  // 带 call 方法的类实例也可以像函数一样调用
  var adder = Adder(10);
  print('adder(5): ${adder(5)}'); // 实际调用 adder.call(5)
}
