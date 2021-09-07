import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first_app/http/DataEntity.dart';

/// 网络库 示例代码
///
/// json反序列化操作放到后台线程处理（compute） https://flutter.dev/docs/cookbook/networking/background-parsing

const testUrl = "https://suggest.taobao.com/sug?code=utf-8&q=nike&callback=cb";

// 程序入口函数
void main() {
  print('test hello dart.');
  // httpGet();
  getRequestByDio(testUrl);
}

// HttpClient 是 dart:io 库中提供的网络请求类，实现了基本的网络编程功能。
// use 内置网络库 dart.io HttpClient
httpGet() async {
  // 创建实例对象，并设置超时时间
  var httpClient = HttpClient()..idleTimeout = Duration(seconds: 10);

  var uri = Uri.parse(testUrl);
  var request = await httpClient.getUrl(uri);
  request.headers.add("user-agent", "Custom-UA");

  // 发起请求，等待响应
  var response = await request.close();

  if (response.statusCode == HttpStatus.ok) {
    var result = await response.transform(utf8.decoder).join();
    print(" result: $result");
  } else {
    print('Error: \nHttp status ${response.statusCode}');
  }
}

// 三方库 dio https://github.com/flutterchina/dio

void getRequestByDio(String testUrl) async {
  Dio dio = Dio();
  var response = await dio.get(testUrl);
  if (response.statusCode == HttpStatus.ok) {
    var rawStr = response.data.toString();
    print("rawString $rawStr");
    var subStr = rawStr.substring(5, rawStr.length - 1);
    print("subStr $subStr");

    var jsonMap = json.decode(subStr); // 将字符串解码成 Map 对象
    var obj = DataEntity.fromJson(jsonMap);
    print(obj);
  } else {
    print("Error: ${response.statusCode}");
  }
}
