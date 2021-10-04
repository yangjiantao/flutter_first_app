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
  // var _initOffset = 1;

  // 实现无限循环
  final _baseOffset = 10000; // 初始偏移
  final _initOffset = 1; // 初始索引位

  @override
  void initState() {
    // 初始化
    _colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green, Colors.black, Colors.purple];
    _pageCtrl = PageController(
        viewportFraction: _viewportFraction,
        // initialPage: _initOffset
        // 通过较大的初始值，制造无限循环的假象（当往左滑动0时无法继续滑动）
        initialPage: _baseOffset + _initOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 不设置组件width时，使用屏幕宽度
    width = widget.width ?? MediaQuery.of(context).size.width;
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
              // itemCount: _colors.length,
              itemCount: null, // 条目个数无限
              controller: _pageCtrl,
              itemBuilder: (ctx, i) => createItemView(_colors, i)),
        ));
  }

  /// 创建PageView itemView
  Widget createItemView(List<Color> colors, int index) {
    index = fixPosition(index, _baseOffset, _colors.length);
    return Container(
        alignment: Alignment.center,
        color: colors[index],
        child: Text("No. $index page", style: TextStyle(color: Colors.white, fontSize: 30)));
  }

  int fixPosition(int realPos, int baseOffset, int length) {
    final int offset = realPos - baseOffset; // 确定起始页
    int result = offset % length;
    print(
        'fixPosition realPos = $realPos , baseOffset = $baseOffset , length = $length, result = $result');
    return result < 0 ? length + result : result;
  }
}
