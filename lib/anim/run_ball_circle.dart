import 'dart:math';

import 'package:flutter/material.dart';

import 'ball.dart';

class RunCircleBallWidget extends StatefulWidget {
  final Size size;

  RunCircleBallWidget({Key? key, this.size = const Size(500, 500)}) : super(key: key);

  @override
  _RunCircleBallWidgetState createState() => _RunCircleBallWidgetState();
}

class _RunCircleBallWidgetState extends State<RunCircleBallWidget>
    with SingleTickerProviderStateMixin {
  // 起始角度
  double _startDegrees = 270;

  // 半径
  static const double circleRadius = 200.0;
  var _ball = Ball(color: Colors.blueAccent, r: 30, aY: 1, vX: 2, vY: -2, x: circleRadius, y: 0.0);
  late AnimationController _controller;
  late final Animation<int> _degreesAnim;

  @override
  void initState() {
    _controller = AnimationController(
        //  创建AnimationController对象
        duration: Duration(seconds: 2),
        vsync: this)
      ..addListener(_renderCircle); // 添加监听，执行渲染

    _degreesAnim = IntTween(begin: 0, end: 360).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var paint = CustomPaint(
      painter: RunBallPainter(_ball),
    );
    return InkWell(
      onTap: () => _controller.repeat(), // 点击时执行动画
      onDoubleTap: () => _controller.stop(), // 双击时暂停动画
      child: SizedBox.fromSize(
        child: paint,
        size: widget.size,
      ),
    );
  }

  // 做圆形运动
  void _renderCircle() {
    setState(() {
      // t += pi / 180; // 每次增加1度
      // _ball.x += cos(t);
      // _ball.y += sin(t);
      var radians = (_degreesAnim.value + _startDegrees) * (pi / 180);
      _ball.x = circleRadius + circleRadius * cos(radians);
      _ball.y = circleRadius + circleRadius * sin(radians);
    });
  }
}
