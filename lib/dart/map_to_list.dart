/// map to list 示例代码
///

void main() {
  var test = MapToListTest();
  var list = test.toList();
  print(list);

  list = test.toList1();
  print(list);
}

class MapToListTest {
  final dataMap = {
    "key1": "value1",
    "key2": "value2",
    "key3": "value3",
    "key4": "value4",
    "key5": "value5",
  };

  List<String> toList() {
    return dataMap.keys.map((key) => "$key -> ${dataMap[key]}").toList();
  }

  List<String> toList1() {
    return dataMap.keys.map((key) {
      // 局部返回，和 toList()方法内 => 实现等价
      return "$key ->1 ${dataMap[key]}";
    }).toList();
  }
}
