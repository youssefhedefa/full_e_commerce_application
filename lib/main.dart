import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/views/login_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/on_boarding_view.dart';

import 'constants/primary_color.dart';
import 'views/sign_up_view.dart';

void main() {
  //runApp(DevicePreview(builder: (context)=> const MyApp() ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
    // builder: DevicePreview.appBuilder,
      theme: ThemeData
        (
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),

       primarySwatch: MyCustomColor(),
        fontFamily: 'Roboto',
      ),
      routes: {
        LoginView.id : (context)=> const LoginView(),
      },
      home: const SignUpView(),
    );
  }
}


