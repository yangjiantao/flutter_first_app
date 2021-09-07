import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first_app/entity/User.dart';

void main() {
  Future<List<User>?> users = fetchUserData();
  users.then((value) => print(
      'size = ${value?.length} ${value?.elementAt(1).name},${value?.elementAt(2).address?.street} '));
}

Future<List<User>?> fetchUserData() async {
  // request test data
  const testUrl = "https://jsonplaceholder.typicode.com/users";
  Dio dio = Dio();
  Response<String> response = await dio.get(testUrl);
  if (response.statusCode == HttpStatus.ok) {
    var rawStr = response.data;
    print("rawString $rawStr");
    var jsonMap =
    json.decode(rawStr!).cast<Map<String, dynamic>>(); // 将字符串解码成 Map 对象
    return jsonMap.map<User>((item) => User.fromJson(item)).toList();
  } else {
    print("Error: ${response.statusCode}");
  }
  return null;
}
