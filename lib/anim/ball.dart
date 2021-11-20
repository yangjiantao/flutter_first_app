import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Ball {
  // 小球信息描述类
  double aX; // 加速度
  double aY; // 加速度Y
  double vX; // 速度X
  double vY; // 速度Y
  double x; // 点位X
  double y; // 点位Y
  Color color; // 颜色
  double r; // 小球半径

  Ball(
      {this.x = 0,
      this.y = 0,
      required this.color,
      this.r = 10,
      this.aX = 0,
      this.aY = 0,
      this.vX = 0,
      this.vY = 0});
}

// 画板painter 绘制小球
class RunBallPainter extends CustomPainter {
  Ball _ball; // 小球
  Paint mPaint = Paint(); // 主画笔
  Paint bgPaint = Paint()..color = Color.fromARGB(148, 198, 246, 248); // 背景画笔

  RunBallPainter(this._ball) {
    mPaint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); // 裁剪区域
    canvas.drawPaint(bgPaint);
    _drawBall(canvas, _ball);
  }

  ///使用[canvas] 绘制[ball]
  void _drawBall(Canvas canvas, Ball ball) {
    canvas.drawCircle(Offset(ball.x + ball.r, ball.y + ball.r), ball.r, mPaint..color = ball.color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
