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
  var response = await dio.get(testUrl);
  if (response.statusCode == HttpStatus.ok) {
    /// Transform the response data to JSON object only when the
    /// content-type of response is "application/json" .
    // 默认返回的是 jsonObject , 以上是dio内部注释
    var rawStr = response.data;
    print("rawString $rawStr");
    return rawStr.map<User>((item) => User.fromJson(item)).toList();
  } else {
    print("Error: ${response.statusCode}");
  }
  return null;
}
