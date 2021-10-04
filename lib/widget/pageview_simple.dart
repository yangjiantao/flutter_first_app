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

  // controller 使用, 设置视图缩放比例和默认显示页面位置
  var _viewportFraction = 0.6; // 视图缩放比
  var _pageCtrl; // 页面控制器
  var _initOffset = 1;

  @override
  void initState() {
    // 初始化
    _colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green, Colors.black, Colors.purple];
    _pageCtrl = PageController(viewportFraction: _viewportFraction, initialPage: _initOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 不设置组件width时，使用屏幕宽度
    width = widget.width ?? MediaQuery
        .of(context)
        .size
        .width;
    height = widget.height ?? 120.0;
    // flutter Text底部黄色双划线 问题:
    // https://www.jianshu.com/p/6278b0867b98
    return Material(
        type: MaterialType.transparency,
        child: Container(
          width: width,
          height: height,
          child: PageView.builder(
              scrollDirection: Axis.horizontal, // 方向
              itemCount: _colors.length,
              controller: _pageCtrl,
              itemBuilder: (ctx, i) => createItemView(_colors, i)),
        ));
  }

  /// 创建PageView itemView
  Widget createItemView(List<Color> colors, int index) {
    return Container(
        alignment: Alignment.center,
        color: colors[index],
        child: Text("No. $index page", style: TextStyle(color: Colors.white, fontSize: 30)));
  }
}
