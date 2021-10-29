import 'package:flutter/material.dart';

class FpsShow extends StatefulWidget {
  @override
  _FpsShowState createState() => _FpsShowState();
}

class _FpsShowState extends State<FpsShow> with SingleTickerProviderStateMixin {
  String _fps = ""; // 文字
  late AnimationController controller;
  var _oldTime = DateTime.now().millisecondsSinceEpoch; // 首次运行的时间

  @override
  void initState() {
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    controller.addListener(_render);
    // controller.repeat();
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 渲染方法 更新状态
  void _render() {
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch;
      var dt = now - _oldTime; // 再次刷新间隔时间（毫秒值）
      _fps = (1000 / dt).toStringAsFixed(1); // 1000毫秒可以刷新多少次
      print("_render fps =$_fps");
      _oldTime = now; // 重新赋值
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
