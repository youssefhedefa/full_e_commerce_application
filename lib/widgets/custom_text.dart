import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign, this.textOverflow, this.maxLines}) : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign ?? TextAlign.start,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? const Color.fromRGBO(53, 65, 176, 0.9),
      ),
    );
  }
}
