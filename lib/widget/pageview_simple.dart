import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// created by jiantao.yang on 2021/10/4
///
/// PageView 使用示例代码
///

class PageViewSimple extends StatefulWidget {
  final double? height; // 组件高度
  final double? width;

  const PageViewSimple({this.height, this.width});

  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  var width;
  var height;
  late List<Color> _colors;

  @override
  void initState() {
    // 初始化
    _colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green, Colors.black, Colors.purple];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 不设置组件width时，使用屏幕宽度
    width = widget.width ?? MediaQuery.of(context).size.width;
    height = widget.height ?? 120.0;
    return Container(
      width: width,
      height: height,
      child: PageView.builder(
          scrollDirection: Axis.horizontal, // 方向
          itemCount: _colors.length,
          itemBuilder: (ctx, i) => createItemView(_colors, i)),
    );
  }

  /// 创建PageView itemView
  Widget createItemView(List<Color> colors, int index) {
    return Container(
        alignment: Alignment.center,
        color: colors[index],
        child: Text("No. $index page", style: TextStyle(color: Colors.white, fontSize: 30)));
  }
}
