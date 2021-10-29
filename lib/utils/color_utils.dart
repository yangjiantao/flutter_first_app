import 'package:flutter/material.dart';
import 'package:flutter_first_app/utils/random_provider.dart';

class ColorUtils {
  static Color randomColor({
    int limitA = 120,
    int limitR = 0,
    int limitG = 0,
    int limitB = 0,
  }) {
    var random = RandomProvider.random;
    var a = limitA + random.nextInt(256 - limitA); // alpha
    var r = limitR + random.nextInt(256 - limitR); // red
    var g = limitG + random.nextInt(256 - limitG); // green
    var b = limitB + random.nextInt(256 - limitB); // blue
    return Color.fromARGB(a, r, g, b);
  }

  /// 使用方法:
  var color1 = ColorUtils.parse("#33428A43");
  var color2 = ColorUtils.parse("#428A43");

  /// 解析颜色 # 开头 6位或8位
  static Color parse(String code) {
    Color result = Colors.red;
    var value = 0;
    if (code.contains("#")) {
      try {
        value = int.parse(code.substring(1), radix: 16);
      } catch (e) {
        print(e);
      }
      switch (code.length) {
        case 1 + 6: // 6 位
          result = Color(value + 0xFF000000);
          break;
        case 1 + 8:
          result = Color(value);
          break;
        default:
          result = Colors.red;
      }
    }
    return result;
  }
}
