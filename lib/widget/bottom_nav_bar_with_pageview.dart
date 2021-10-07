import 'package:flutter/material.dart';
import 'package:flutter_first_app/widget/bottom_nav_bar_simple.dart';
import 'package:flutter_first_app/widget/pageview_item.dart';

/// bottomNavBar + PageView 简单用法
/// created by jiantao.yang on 2021/10/7
///
class BottomNavigationBarWithPageView extends StatefulWidget {
  @override
  _BottomNavigationBarWithPageViewState createState() {
    return _BottomNavigationBarWithPageViewState();
  }
}

class _BottomNavigationBarWithPageViewState extends State<BottomNavigationBarWithPageView> {
  var _position = 0;
  final iconsMap = {
    //底栏图标
    "图鉴": Icons.home, "动态": Icons.toys,
    "喜欢": Icons.favorite, "手册": Icons.class_,
    "我的": Icons.account_circle,
  };
  final _colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
  ];

  // 页面控制器
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      initialPage: _position,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.orange.withAlpha(88),
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: PageView(
              controller: _controller,
              children: iconsMap.keys
                  .map((key) => Center(
                        child: key == "手册" ? CustomBottomNavigationBar() : PageViewItem(title: key),
                      ))
                  .toList(),
            ),
          ),
          _buildBottomNavigationBar()
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (position) {
          _controller.jumpToPage(position);
          setState(() => _position = position);
        },
        currentIndex: _position,
        elevation: 1,
        // backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: _colors[_position],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: iconsMap.keys
            .map((key) =>
            BottomNavigationBarItem(
                label: key, icon: Icon(iconsMap[key]), backgroundColor: _colors[_position]))
            .toList());
  }
}
