import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first_app/entity/User.dart';

void main() {
  fetchUserData();
}

Future<List<User>?> fetchUserData() async {
  // request test data
  const testUrl = "https://jsonplaceholder.typicode.com/users";
  Dio dio = Dio();
  var response = await dio.get(testUrl);
  if (response.statusCode == HttpStatus.ok) {
    var rawStr = response.data.toString();
    print("rawString $rawStr");
    // var jsonMap = json.decode(rawStr); // 将字符串解码成 Map 对象
    // print(jsonMap);
  } else {
    print("Error: ${response.statusCode}");
  }
  return null;
}
