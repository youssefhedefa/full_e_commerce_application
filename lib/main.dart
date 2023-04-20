import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/views/login_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/on_boarding_view.dart';

import 'constants/primary_color.dart';

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
       primarySwatch: MyCustomColor(),
        fontFamily: 'Roboto',
        //primaryColor: MaterialColor(Color.fromRGBO(53, 65, 176, 0.9)),
      ),
      routes: {
        LoginView.id : (context)=> const LoginView(),
      },
      home: const OnBoardingView(),
    );
  }
}


