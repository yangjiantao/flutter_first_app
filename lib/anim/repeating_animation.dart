// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class RepeatingAnimationDemo extends StatefulWidget {
  const RepeatingAnimationDemo({Key? key}) : super(key: key);
  static String routeName = '/misc/repeating_animation';

  @override
  RepeatingAnimationDemoState createState() => RepeatingAnimationDemoState();
}

class RepeatingAnimationDemoState extends State<RepeatingAnimationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // late final Animation<BorderRadius?> _borderRadius;
  late final Animation<int> _sizeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..repeat(reverse: true);

    _sizeAnim = IntTween(begin: 0, end: 50).animate(_controller);
    // _borderRadius = BorderRadiusTween(
    //   begin: BorderRadius.circular(100.0),
    //   end: BorderRadius.circular(0.0),
    // ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repeating Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnim,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200 + _sizeAnim.value.toDouble(),
                  height: 200 + _sizeAnim.value.toDouble(),
                  decoration:
                      BoxDecoration(color: Colors.black26, shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      // offset: Offset(1,1),
                      blurRadius: 5,
                      // spreadRadius: 1
                    )
                  ]),
                ),
                Image.asset("images/playGo.png",
                    width: 60 + _sizeAnim.value.toDouble(),
                    height: 60 + _sizeAnim.value.toDouble()),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
