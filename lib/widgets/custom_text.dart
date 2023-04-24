import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.fontSize, this.fontWeight, this.color}) : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? const Color.fromRGBO(53, 65, 176, 0.9),
      ),
    );
  }
}
