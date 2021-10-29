import 'package:flutter/material.dart';

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

class RunBallWidget extends StatefulWidget {
  final Size size;

  RunBallWidget({Key? key, this.size = const Size(300, 300)}) : super(key: key);

  @override
  _RunBallWidgetState createState() => _RunBallWidgetState();
}

class _RunBallWidgetState extends State<RunBallWidget> with SingleTickerProviderStateMixin {
  var _ball = Ball(color: Colors.blueAccent, r: 10, aY: 0.1, vX: 2, vY: -2, x: 0.0, y: 0.0);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        //  创建AnimationController对象
        duration: Duration(seconds: 3),
        vsync: this)
      ..addListener(_render); // 添加监听，执行渲染
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

  void _render() {
    setState(() {
      // 渲染方法，更新小球信息
      _ball.x += 1;
      _ball.y += 1;
    });
  }
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
