// 抽象类不能实例化
// 注意一:继承自抽象类后,必须实现抽象类的抽象方法
void main(List<String> args) {}

abstract class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name is eating');
  }

  void sleep() {
    print('$name is sleeping');
  }
}
