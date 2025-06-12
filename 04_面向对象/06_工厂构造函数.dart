//普通的构造函数:会自动返回创建出来的对象,不能手动的返回
//工厂构造函数最大的特点:可以手动的返回一个对象
class Person {
  String name;
  String color;

  static final Map<String, Person> _nameCache = {};
  static final Map<String, Person> _colorCache = {};

  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name]!;
    } else {
      final p = Person._internal(name, "");
      _nameCache[name] = p;
      return p;
    }
  }

  factory Person.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color]!;
    } else {
      final p = Person._internal("", color);
      _colorCache[color] = p;
      return p;
    }
  }

  // 私有构造函数
  Person._internal(this.name, this.color);

  @override
  String toString() {
    return 'Person{name: $name, color: $color}';
  }
}

void main() {
  // 测试按名字缓存
  final p1 = Person.withName("why");
  final p2 = Person.withName("why");
  print(identical(p1, p2)); // true

  // 测试按颜色缓存
  final p3 = Person.withColor("red");
  final p4 = Person.withColor("red");
  print(identical(p3, p4)); // true

  // 不同类型缓存产生不同对象
  final p5 = Person.withName("red");
  final p6 = Person.withColor("red");
  print(identical(p5, p6)); // false
}
