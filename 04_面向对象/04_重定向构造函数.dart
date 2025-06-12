void main(List<String> args) {}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}
