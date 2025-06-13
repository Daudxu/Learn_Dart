// Dart 异步编程示例
import 'dart:async';
import 'dart:isolate';
import 'dart:math';

void main() async {
  print('程序开始执行');

  // 1. 基本的 Future 使用
  print('\n--- 基本的 Future 使用 ---');

  // 使用 then 处理 Future
  fetchUserName()
      .then((name) {
        print('用户名: $name');
      })
      .catchError((error) {
        print('发生错误: $error');
      })
      .whenComplete(() {
        print('fetchUserName 操作完成');
      });

  // 2. 使用 async/await
  print('\n--- 使用 async/await ---');
  try {
    String name = await fetchUserName();
    print('用户名 (来自 await): $name');
  } catch (e) {
    print('发生错误 (来自 await): $e');
  } finally {
    print('fetchUserName await 操作完成');
  }

  // 3. 串行异步操作
  print('\n--- 串行异步操作 ---');
  await serialAsyncOperations();

  // 4. 并行异步操作
  print('\n--- 并行异步操作 ---');
  await parallelAsyncOperations();

  // 5. Future.delayed 的使用
  print('\n--- Future.delayed 的使用 ---');
  await delayedGreeting();

  // 6. 超时处理
  print('\n--- 超时处理 ---');
  await handleTimeout();

  // 7. Stream 的基本使用
  print('\n--- Stream 的基本使用 ---');
  await streamExample();

  // 8. 异步生成器
  print('\n--- 异步生成器 ---');
  await asyncGeneratorExample();

  // 9. 使用 Completer 手动控制异步操作
  print('\n--- 使用 Completer 手动控制异步操作 ---');
  await completerExample();

  // 10. 使用 Isolate 进行并发计算
  print('\n--- 使用 Isolate 进行并发计算 ---');
  await isolateExample();

  // 11. 使用 compute 函数简化 Isolate 使用
  print('\n--- 使用 compute 函数 ---');
  await computeExample();

  print('\n程序执行结束');
}

// 模拟从服务器获取用户名
Future<String> fetchUserName() {
  return Future.delayed(Duration(seconds: 2), () {
    // 模拟随机成功或失败
    if (DateTime.now().millisecond % 10 > 2) {
      return '张三';
    } else {
      throw Exception('获取用户名失败');
    }
  });
}

// 模拟网络请求
Future<Map<String, dynamic>> fetchUserData() {
  return Future.delayed(Duration(seconds: 1), () {
    return {'id': 1, 'name': '李四', 'email': 'lisi@example.com'};
  });
}

// 模拟数据库查询
Future<List<String>> fetchUserPosts() {
  return Future.delayed(Duration(milliseconds: 800), () {
    return ['我的第一篇文章', '学习 Dart 异步编程', '如何使用 Flutter'];
  });
}

// 串行异步操作示例
Future<void> serialAsyncOperations() async {
  print('开始串行操作...');

  // 第一个操作
  final userData = await fetchUserData();
  print('获取用户数据: $userData');

  // 第二个操作，依赖第一个操作的结果
  final posts = await fetchUserPosts();
  print('获取用户文章: $posts');

  // 第三个操作，使用前两个操作的结果
  print('用户 ${userData['name']} 共有 ${posts.length} 篇文章');

  print('串行操作完成');
}

// 并行异步操作示例
Future<void> parallelAsyncOperations() async {
  print('开始并行操作...');

  // 同时启动两个异步操作
  final userDataFuture = fetchUserData();
  final postsFuture = fetchUserPosts();

  // 等待所有操作完成
  final results = await Future.wait([userDataFuture, postsFuture]);

  final userData = results[0] as Map<String, dynamic>;
  final posts = results[1] as List<String>;

  print('并行获取：用户 ${userData['name']} 共有 ${posts.length} 篇文章');
  print('并行操作完成');
}

// 使用 Future.delayed 的示例
Future<void> delayedGreeting() async {
  print('等待 3 秒...');

  // 等待指定时间
  await Future.delayed(Duration(seconds: 3));

  print('3 秒过去了！');
}

// 处理超时的示例
Future<void> handleTimeout() async {
  try {
    print('启动一个可能超时的操作...');

    // 创建一个需要 5 秒的操作
    var result = await longOperation().timeout(
      Duration(seconds: 2),
      onTimeout: () => '操作超时了！',
    );

    print('操作结果: $result');
  } catch (e) {
    print('超时操作出错: $e');
  }
}

// 一个长时间的操作
Future<String> longOperation() {
  return Future.delayed(Duration(seconds: 5), () {
    return '操作完成';
  });
}

// Stream 示例
Future<void> streamExample() async {
  print('开始接收数据流...');

  // 创建一个数据流
  final stream = countStream(5);

  // 监听数据流
  await for (var value in stream) {
    print('从流中接收到: $value');
  }

  print('数据流接收完毕');
}

// 创建一个简单的计数器流
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

// 异步生成器示例
Future<void> asyncGeneratorExample() async {
  print('使用异步生成器...');

  await for (var data in generateAsyncData()) {
    print('生成的数据: $data');
  }

  print('异步生成器完成');
}

// 异步生成器函数
Stream<String> generateAsyncData() async* {
  yield '第一条数据';
  await Future.delayed(Duration(milliseconds: 300));

  yield '第二条数据';
  await Future.delayed(Duration(milliseconds: 300));

  yield* moreAsyncData(); // 组合另一个 Stream

  yield '最后一条数据';
}

Stream<String> moreAsyncData() async* {
  yield '嵌套数据 1';
  await Future.delayed(Duration(milliseconds: 300));

  yield '嵌套数据 2';
  await Future.delayed(Duration(milliseconds: 300));
}

// 使用 Completer 控制异步操作
Future<void> completerExample() async {
  print('开始 Completer 示例...');

  try {
    String result = await manualAsyncOperation();
    print('Completer 操作结果: $result');
  } catch (e) {
    print('Completer 操作出错: $e');
  }

  print('Completer 示例结束');
}

Future<String> manualAsyncOperation() {
  final completer = Completer<String>();

  // 模拟某些异步操作，比如监听事件
  Future.delayed(Duration(seconds: 1), () {
    // 成功时完成
    if (DateTime.now().second % 2 == 0) {
      completer.complete('操作成功了！');
    } else {
      // 失败时抛出异常
      completer.completeError(Exception('手动操作失败'));
    }
  });

  return completer.future;
}

// ----- Isolate 和 compute 相关示例 ----

// Isolate 示例 - 计算大量斐波那契数列
Future<void> isolateExample() async {
  print('在主 Isolate 中执行...');
  final stopwatch = Stopwatch()..start();

  // 创建一个接收端口来接收消息
  final receivePort = ReceivePort();

  // 启动新的 Isolate
  print('启动计算 Isolate...');
  await Isolate.spawn(calculateFibonacciInIsolate, [40, receivePort.sendPort]);

  // 等待结果
  final result = await receivePort.first as int;
  stopwatch.stop();

  print('计算结果: $result');
  print('耗时: ${stopwatch.elapsedMilliseconds} 毫秒');
}

// 这个函数在单独的 Isolate 中运行
void calculateFibonacciInIsolate(List<dynamic> args) {
  final n = args[0] as int;
  final sendPort = args[1] as SendPort;

  // 计算斐波那契数
  final result = fibonacci(n);

  // 发送结果回主 Isolate
  sendPort.send(result);
}

// 使用 compute 函数示例
Future<void> computeExample() async {
  print('使用 compute 函数简化 Isolate 使用...');
  final stopwatch = Stopwatch()..start();

  // 使用 compute 函数在单独的 Isolate 中执行计算
  final result = await compute(fibonacci, 40);

  stopwatch.stop();
  print('计算结果: $result');
  print('耗时: ${stopwatch.elapsedMilliseconds} 毫秒');

  // 处理一个列表
  print('\n处理列表数据...');
  final List<int> numbers = List.generate(10000, (i) => i);
  final processedData = await compute(processNumbers, numbers);

  print('处理后的数据 (前 5 个): ${processedData.take(5).toList()}');
  print('处理后的数据总和: ${processedData.reduce((a, b) => a + b)}');
}

// 用于计算斐波那契数的函数
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 用于处理大量数据的函数
List<int> processNumbers(List<int> numbers) {
  // 模拟复杂计算 - 对每个数字进行平方和开平方根操作
  return numbers.map((n) => sqrt(n * n).round()).toList();
}

// Flutter 中 compute 函数的模拟实现
Future<R> compute<Q, R>(Function(Q message) callback, Q message) async {
  final responsePort = ReceivePort();
  final args = [callback, message, responsePort.sendPort];

  final isolate = await Isolate.spawn(_isolateEntry, args);
  final response = await responsePort.first as R;

  // 完成后销毁 Isolate
  responsePort.close();
  isolate.kill();

  return response;
}

// Isolate 入口点
void _isolateEntry(List<dynamic> args) {
  final callback = args[0] as Function;
  final message = args[1];
  final sendPort = args[2] as SendPort;

  // 执行回调并返回结果
  final result = callback(message);
  sendPort.send(result);
}
