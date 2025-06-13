// Dart then链式调用示例
import 'dart:async';

void main() {
  // 1. 普通调用方式
  print('\n--- 普通调用方式 ---');
  var calculator1 = Calculator(0);
  calculator1.add(5);
  calculator1.subtract(2);
  calculator1.multiply(3);
  calculator1.divide(2);
  print('结果: ${calculator1.value}');

  // 2. 链式调用方式
  print('\n--- 链式调用方式 ---');
  var calculator2 = Calculator(0);
  var result = calculator2.add(5).subtract(2).multiply(3).divide(2).value;
  print('结果: $result');

  // 3. 使用级联运算符（cascade operator）
  print('\n--- 级联运算符 ---');
  var calculator3 = Calculator(0)
    ..add(5)
    ..subtract(2)
    ..multiply(3)
    ..divide(2);
  print('结果: ${calculator3.value}');

  // 4. 字符串构建器链式调用
  print('\n--- 字符串构建器链式调用 ---');
  var stringBuilder = StringBuilder()
      .append('Hello')
      .append(' ')
      .append('World')
      .append('!')
      .toString();
  print(stringBuilder);

  // 5. 查询构建器链式调用
  print('\n--- 查询构建器链式调用 ---');
  var query = QueryBuilder()
      .select(['name', 'age', 'email'])
      .from('users')
      .where('age > 18')
      .orderBy('name', descending: false)
      .limit(10)
      .build();
  print(query);

  // 6. UI构建示例（模拟）
  print('\n--- UI构建示例 ---');
  var button = Button()
      .setText('点击我')
      .setColor('blue')
      .setWidth(100)
      .setHeight(50)
      .setOnClick(() {
        print('按钮被点击');
      });

  button.click();
  button.describe();

  // 7. Future.then 链式调用示例
  print('\n--- Future.then 链式调用示例 ---');

  // 模拟异步操作
  print('开始异步操作链...');

  fetchUserData()
      .then((userData) {
        print('用户数据: $userData');
        return fetchUserPosts(userData['id'] as int);
      })
      .then((posts) {
        print('用户文章: $posts');
        return calculateReadingTime(posts);
      })
      .then((readingTime) {
        print('总阅读时间: $readingTime 分钟');
        return sendAnalytics(readingTime);
      })
      .then((_) {
        print('分析数据已发送');
      })
      .catchError((error) {
        print('链式调用过程中出错: $error');
      })
      .whenComplete(() {
        print('链式异步操作完成');
      });

  print('异步操作已开始，但执行将在后台继续...');

  // 8. 同时处理多个 Future 结果
  print('\n--- 同时处理多个 Future 结果 ---');

  Future.wait([fetchUserData(), fetchAllCategories()])
      .then((results) {
        final userData = results[0] as Map<String, dynamic>;
        final categories = results[1] as List<String>;

        print('用户名: ${userData['name']}, 可用分类: $categories');
        return combineUserWithCategories(userData, categories);
      })
      .then((combinedData) {
        print('组合后的数据: $combinedData');
      });
}

// 模拟异步获取用户数据
Future<Map<String, dynamic>> fetchUserData() {
  return Future.delayed(Duration(seconds: 2), () {
    return {'id': 1, 'name': '张三', 'email': 'zhangsan@example.com'};
  });
}

// 模拟异步获取用户文章
Future<List<String>> fetchUserPosts(int userId) {
  return Future.delayed(Duration(seconds: 1), () {
    return ['如何学习 Dart', 'Flutter 入门指南', 'Dart 异步编程'];
  });
}

// 模拟计算阅读时间
Future<int> calculateReadingTime(List<String> posts) {
  return Future.delayed(Duration(milliseconds: 500), () {
    // 假设每篇文章需要5分钟阅读
    return posts.length * 5;
  });
}

// 模拟发送分析数据
Future<bool> sendAnalytics(int readingTime) {
  return Future.delayed(Duration(milliseconds: 700), () {
    print('正在发送分析数据...');
    return true;
  });
}

// 模拟获取所有分类
Future<List<String>> fetchAllCategories() {
  return Future.delayed(Duration(seconds: 1), () {
    return ['技术', '教育', '健康', '娱乐'];
  });
}

// 组合用户和分类数据
Future<Map<String, dynamic>> combineUserWithCategories(
  Map<String, dynamic> userData,
  List<String> categories,
) {
  return Future.delayed(Duration(milliseconds: 500), () {
    return {
      'user': userData,
      'categories': categories,
      'recommendedCategory': categories[0],
    };
  });
}

// 1. 计算器类 - 返回 this 实现链式调用
class Calculator {
  double _value;

  Calculator(this._value);

  // 每个方法操作后返回 this，以实现链式调用
  Calculator add(double number) {
    _value += number;
    return this;
  }

  Calculator subtract(double number) {
    _value -= number;
    return this;
  }

  Calculator multiply(double number) {
    _value *= number;
    return this;
  }

  Calculator divide(double number) {
    if (number != 0) {
      _value /= number;
    } else {
      print('警告: 不能除以零');
    }
    return this;
  }

  // 提供值的访问
  double get value => _value;
}

// 2. 字符串构建器 - 链式连接字符串
class StringBuilder {
  final StringBuffer _buffer = StringBuffer();

  StringBuilder append(String str) {
    _buffer.write(str);
    return this;
  }

  StringBuilder appendLine(String str) {
    _buffer.writeln(str);
    return this;
  }

  StringBuilder clear() {
    _buffer.clear();
    return this;
  }

  @override
  String toString() {
    return _buffer.toString();
  }
}

// 3. SQL查询构建器 - 流式API设计
class QueryBuilder {
  List<String>? _selectColumns;
  String? _fromTable;
  String? _whereClause;
  String? _orderByColumn;
  bool _isDescending = false;
  int? _limitCount;

  QueryBuilder select(List<String> columns) {
    _selectColumns = columns;
    return this;
  }

  QueryBuilder from(String table) {
    _fromTable = table;
    return this;
  }

  QueryBuilder where(String condition) {
    _whereClause = condition;
    return this;
  }

  QueryBuilder orderBy(String column, {bool descending = false}) {
    _orderByColumn = column;
    _isDescending = descending;
    return this;
  }

  QueryBuilder limit(int count) {
    _limitCount = count;
    return this;
  }

  String build() {
    if (_selectColumns == null || _fromTable == null) {
      throw Exception('查询必须至少包含 SELECT 和 FROM 部分');
    }

    var query = 'SELECT ${_selectColumns!.join(', ')} FROM $_fromTable';

    if (_whereClause != null) {
      query += ' WHERE $_whereClause';
    }

    if (_orderByColumn != null) {
      query += ' ORDER BY $_orderByColumn';
      if (_isDescending) {
        query += ' DESC';
      }
    }

    if (_limitCount != null) {
      query += ' LIMIT $_limitCount';
    }

    return query;
  }
}

// 4. UI按钮构建器（模拟）
class Button {
  String _text = '';
  String _color = 'gray';
  double _width = 0;
  double _height = 0;
  Function? _onClick;

  Button setText(String text) {
    _text = text;
    return this;
  }

  Button setColor(String color) {
    _color = color;
    return this;
  }

  Button setWidth(double width) {
    _width = width;
    return this;
  }

  Button setHeight(double height) {
    _height = height;
    return this;
  }

  Button setOnClick(Function callback) {
    _onClick = callback;
    return this;
  }

  void click() {
    if (_onClick != null) {
      _onClick!();
    }
  }

  void describe() {
    print('按钮: 文本="$_text", 颜色=$_color, 尺寸=${_width}x$_height');
  }
}
