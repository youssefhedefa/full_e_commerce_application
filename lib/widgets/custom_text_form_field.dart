import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key, required this.keyboardType, this.obscureText, this.decoration})
      : super(key: key);
  final TextInputType keyboardType;
  final bool? obscureText;
  final InputDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: decoration,
      style: const TextStyle(
        fontSize: 22,
      ),
    );
  }
}
