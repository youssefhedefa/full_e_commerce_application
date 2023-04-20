import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/views/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const OnBoardingView(),
    );
  }
}
