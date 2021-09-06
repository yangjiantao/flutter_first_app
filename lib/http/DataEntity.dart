/// 测试数据结构实体类

class DataEntity {
  String shop;
  String tmall;
  List<List<String>> result;

  DataEntity({required this.shop, required this.tmall, required this.result});

  //JSON 解析工厂类，使用字典数据为对象初始化赋值
  factory DataEntity.fromJson(Map<String, dynamic> parsedJson) {
    return DataEntity(
        shop: parsedJson['shop'],
        tmall: parsedJson['tmall'],
        result: parsedJson['result'].cast<List<String>>());
  }

  @override
  String toString() {
    // FIXME json数据中 array嵌套结构如何解析？
    /// 使用 result.elementAt(0) 时： type 'List<dynamic>' is not a subtype of type 'List<String>' in type cast
    return 'DataEntity{shop: $shop, tmall: $tmall, result: ${result.length}}';
  }
}
