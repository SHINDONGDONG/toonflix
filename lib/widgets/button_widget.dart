import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle textStyle;

  const ButtonWidget({Key? key, required this.color, required this.text, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(text, style:  textStyle,),
      ),
    );
  }
}
