import 'package:flutter/material.dart';
class MyCustomColor extends MaterialColor {
  static const int _primaryValue = 0xFF123456;



  MyCustomColor() : super(_primaryValue, <int, Color>{
    50: const Color(0xFFE7F8FB),
    100: const Color(0xFFB6E7F0),
    200: const Color(0xFF84D5E2),
    300: const Color(0xFF53C3D3),
    400: const Color(0xFF32B1C5),
    500: const Color.fromRGBO(53, 65, 176, 0.9),
    600: const Color(0xFF0F8A9A),
    700: const Color(0xFF0C7781),
    800: const Color(0xFF096469),
    900: const Color(0xFF064C51),
  });

  static Color defaultColor = const Color.fromRGBO(53, 65, 176, 0.9);
}
