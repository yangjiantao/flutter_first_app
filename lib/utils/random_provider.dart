import 'dart:math';

class RandomProvider {
  RandomProvider._(); // 私有化构造
  static final _random = Random();

  // 明确返回值 Random,避免使用的地方IDE无法识别导致编译失败
  static Random get random => _random;
}
