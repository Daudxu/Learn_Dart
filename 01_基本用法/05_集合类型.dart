void main() {
  // // List（列表/数组）
  // List<int> numbers = [1, 2, 3, 4, 5];
  // print(numbers);
  // numbers.add(6);
  // print(numbers);
  // numbers.remove(3);
  // print(numbers);
  // print(numbers.length);
  // print(numbers.contains(2));

  // // 遍历 List
  // for (var n in numbers) {
  //   print('List item: $n');
  // }

  // // Set（集合，元素唯一，无序）
  // Set<String> fruits = {'apple', 'banana', 'orange'};
  // print(fruits);
  // fruits.add('banana'); // 不会重复添加
  // fruits.add('grape');
  // print(fruits);

  // // 遍历 Set
  // fruits.forEach((f) => print('Set item: $f'));

  // // Map（字典/映射）
  // Map<String, int> scores = {'Tom': 90, 'Jerry': 85};
  // print(scores);
  // scores['Spike'] = 88;
  // print(scores);
  // print(scores['Tom']);

  // // 遍历 Map
  // scores.forEach((key, value) {
  //   print('$key: $value');
  // });

  // // 判断集合是否为空
  // print(numbers.isEmpty); // false
  // print(fruits.isNotEmpty); // true
  // print(scores.isEmpty); // false

  // // 获取集合的长度
  // print(numbers.length);
  // print(fruits.length);
  // print(scores.length);

  //List / Set / Map

  // List、Set 和 Map 都是 Dart 中的集合类型，用于存储多个值。
  // List 是有序的，可以包含重复元素，使用 [] 定义。
  List<String> list = ['apple', 'banana', 'orange'];
  // Set 是无序的，不允许重复元素，使用 {} 定义。
  Set<String> set = {'apple', 'banana', 'orange'};
  // Map 是键值对的集合，使用 {} 定义，键和值可以是任意类型。
  Map<String, int> map = {'apple': 1, 'banana': 2, 'orange': 3};
  // List、Set 和 Map 都有自己的方法和属性，可以进行各种操作，如添加、删除、查找等。
  print('List: $list');
  print('Set: $set');
  print('Map: $map');

  // List定义
  // 1.使用类型推导定义
  var letters = ['a', 'b', 'c', 'd', 'e'];
  print('$letters ${letters.runtimeType}'); // 输出: [a, b, c, d, e] List<String>
  // 2.明确指定类型
  List<int> numbers = [1, 2, 3, 4, 5];
  print('$numbers ${numbers.runtimeType}'); // 输出: [1, 2, 3, 4, 5] List<int>

  // Set的定义
  // 1.使用类型推导定义
  var uniqueLetters = {'a', 'b', 'c', 'd', 'e'};
  print(
    '$uniqueLetters ${uniqueLetters.runtimeType}',
  ); // 输出: {a, b, c, d, e} Set<String>
  // 2.明确指定类型

  Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
  print(
    '$uniqueNumbers ${uniqueNumbers.runtimeType}',
  ); // 输出: {1, 2, 3, 4, 5} Set<int>

  // Map的定义
  // 1.使用类型推导定义
  var infoMap1 = {"name": "Alice", "age": 30, "city": "New York"};
  print(
    '$infoMap1 ${infoMap1.runtimeType}',
  ); // 输出: {name: Alice, age: 30, city: New York} Map<String, dynamic>
  // 2.明确指定类型
  Map<String, int> infoMap2 = {"apple": 1, "banana": 2, "orange": 3};
  print(
    '$infoMap2 ${infoMap2.runtimeType}',
  ); // 输出: {apple: 1, banana: 2, orange: 3} Map<String, int>

  // 第一类，是所有集合都支持的获取长度的属性length：
  print('List length: ${numbers.length}'); // 输出: List length: 3
  print('Set length: ${infoMap1.length}'); // 输出: Set length: 3
  print('map length: ${infoMap2.length}'); // 输出: map length: 3

  // 添加/删除/包含元素
  // List 支持添加元素
  numbers.add(6); // 添加元素
  print(
    'List after adding: $numbers',
  ); // 输出: List after adding: [1, 2, 3, 4, 5, 6]
  numbers.remove(3); // 删除元素
  print(
    'List after removing: $numbers',
  ); // 输出: List after removing: [1, 2, 4, 5, 6]
  print('List contains 2: ${numbers.contains(2)}'); // 输出: List contains 2: true
  // Set 支持添加元素
  uniqueNumbers.add(6); // 添加元素
  print(
    'Set after adding: $uniqueNumbers',
  ); // 输出: Set after adding: {1, 2, 3, 4, 5, 6}
  uniqueNumbers.remove(3); // 删除元素
  print(
    'Set after removing: $uniqueNumbers',
  ); // 输出: Set after removing: {1, 2, 4, 5, 6}
  print(
    'Set contains 2: ${uniqueNumbers.contains(2)}',
  ); // 输出: Set contains 2: true
  // Map 支持添加键值对
  infoMap2['grape'] = 4; // 添加键值对
  print(
    'Map after adding: $infoMap2',
  ); // 输出: Map after adding: {apple: 1, banana: 2, orange: 3, grape: 4}
  infoMap2.remove('banana'); // 删除键值对
  print(
    'Map after removing: $infoMap2',
  ); // 输出: Map after removing: {apple: 1, orange: 3, grape: 4}
  print(
    'Map contains key "apple": ${infoMap2.containsKey("apple")}',
  ); // 输出: Map contains key "apple": true
  print(
    'Map contains value 2: ${infoMap2.containsValue(2)}',
  ); // 输出: Map contains value 2: false
  // 遍历集合
  // List 遍历
  for (var item in numbers) {
    print('List item: $item'); // 输出: List item: 1, List item: 2, ...
  }
  // Set 遍历
  for (var item in uniqueNumbers) {
    print('Set item: $item'); // 输出: Set item: 1, Set item: 2, ...
  }
  // Map 遍历
  infoMap2.forEach((key, value) {
    print(
      'Map item: $key -> $value',
    ); // 输出: Map item: apple -> 1, Map item: orange -> 3, ...
  });
  // removeAt
  // List 支持根据索引删除元素
  numbers.removeAt(0); // 删除索引为 0 的元素
  // 注意事项
  // 1. List、Set 和 Map 都是泛型集合，可以指定元素类型。
  // 2. List 是有序的，可以包含重复元素，Set 是无序的，不允许重复元素，Map 是键值对的集合。
  // 3. List、Set 和 Map 都有自己的方法和属性，可以进行各种操作，如添加、删除、查找等。
  // 4. 在使用集合时，注意元素类型的一致性，避免类型错误。
  // 5. List、Set 和 Map 都是可变的，可以动态添加或删除元素，但在遍历时要注意不要修改集合的结构。
  // 由于它有key和value，因此无论是读取值，还是操作，都要明确是基于key的，还是基于value的，或者是基于key/value对的。

  // Map的操作
  // 1.根据key获取value
  // print(infoMap1['name']); // why

  // // 2.获取所有的entries
  // print(
  //   '${infoMap1.entries} ${infoMap1.entries.runtimeType}',
  // ); // (MapEntry(name: why), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

  // // 3.获取所有的keys
  // print(
  //   '${infoMap1.keys} ${infoMap1.keys.runtimeType}',
  // ); // (name, age) _CompactIterable<String>

  // // 4.获取所有的values
  // print(
  //   '${infoMap1.values} ${infoMap1.values.runtimeType}',
  // ); // (why, 18) _CompactIterable<Object>

  // // 5.判断是否包含某个key或者value
  // print(
  //   '${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}',
  // ); // true true

  // // 6.根据key删除元素
  // infoMap1.remove('age');
  // print('${infoMap1}'); // {name: why}
}
