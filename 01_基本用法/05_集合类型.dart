void main() {
  // List（列表/数组）
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  numbers.add(6);
  print(numbers);
  numbers.remove(3);
  print(numbers);
  print(numbers.length);
  print(numbers.contains(2));

  // 遍历 List
  for (var n in numbers) {
    print('List item: $n');
  }

  // Set（集合，元素唯一，无序）
  Set<String> fruits = {'apple', 'banana', 'orange'};
  print(fruits);
  fruits.add('banana'); // 不会重复添加
  fruits.add('grape');
  print(fruits);

  // 遍历 Set
  fruits.forEach((f) => print('Set item: $f'));

  // Map（字典/映射）
  Map<String, int> scores = {'Tom': 90, 'Jerry': 85};
  print(scores);
  scores['Spike'] = 88;
  print(scores);
  print(scores['Tom']);

  // 遍历 Map
  scores.forEach((key, value) {
    print('$key: $value');
  });

  // 判断集合是否为空
  print(numbers.isEmpty); // false
  print(fruits.isNotEmpty); // true
  print(scores.isEmpty); // false

  // 获取集合的长度
  print(numbers.length);
  print(fruits.length);
  print(scores.length);
}
