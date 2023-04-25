import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/hello_view.dart';
import 'package:full_e_commerce_application/views/log_in/login_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/on_boarding_view.dart';
import 'bloc_observer.dart';
import 'constants/primary_color.dart';
import 'views/sign_up_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
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
        SignUpView.id : (context) => const SignUpView(),
        HelloView.id : (context) => const HelloView(),
      },
      home: const OnBoardingView(),
    );
  }
}


