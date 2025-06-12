void main(List<String> args) {
  var p = Person('张三', 18, 'IT');
  print(p);
}

class Animal {
  String name;
  int age;
  Animal(this.name, this.age);
}

class Person extends Animal {
  String job;
  Person(String name, int age, this.job) : super(name, age);

  @override
  String toString() {
    return 'Person{name: $name, age: $age, job: $job}';
  }
}
