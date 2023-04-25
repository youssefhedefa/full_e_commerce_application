import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key, required this.keyboardType, this.obscureText, this.decoration, this.onChanged, this.onFieldSubmitted, this.controller, this.validator})
      : super(key: key);
  final TextInputType keyboardType;
  final bool? obscureText;
  final InputDecoration? decoration;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: decoration,
      style: const TextStyle(
        fontSize: 22,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator:validator ,
    );
  }
}
