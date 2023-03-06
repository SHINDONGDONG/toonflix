import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({Key? key}) : super(key: key);

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int counter = 0;
  List<int> number = [];

  //build메서드보다 먼저 빌드되고 한번만 빌드된다.
  @override
  void initState() {
    super.initState();
    print("Hellow!!!");
  }

  //위젯이 스크린에서 제거될때 불리는메소드
  @override
  void dispose() {
    super.dispose();
    print("Dispose!");
  }

  bool showTitle = true;
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }
  void _onClick() {
    //새로고침이라는 setState
    setState(() {
      number.add(number.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Click Count',
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            IconButton(onPressed: toggleTitle, icon: showTitle ? Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined),),
            for(var n in number) Text('$n'),
            IconButton(
              iconSize: 40,
              onPressed: _onClick,
              icon: Icon(Icons.add_box_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
