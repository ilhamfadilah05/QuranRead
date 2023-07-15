import 'package:flutter/material.dart';

class TextDef extends StatelessWidget {
  TextDef(
      {super.key,
      required this.message,
      required this.size,
      required this.color,
      this.fw,
      this.textDirection});
  String message;
  double size;
  Color color;
  FontWeight? fw;
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textDirection: textDirection ?? TextDirection.ltr,
      style: TextStyle(
          fontFamily: 'poppins',
          fontSize: size,
          color: color,
          fontWeight: fw ?? FontWeight.normal),
    );
  }
}
