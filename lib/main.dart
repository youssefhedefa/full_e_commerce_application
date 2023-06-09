import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/network/local/cache_helper.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/hello_view.dart';
import 'package:full_e_commerce_application/views/log_in/login_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/on_boarding_view.dart';
import 'package:full_e_commerce_application/views/home/home_view.dart';
import 'package:full_e_commerce_application/views/products/products_view.dart';
import 'bloc_observer.dart';
import 'constants/primary_color.dart';
import 'views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();


  bool? isOnBoardingSubmitted = CacheHelper.getStartingScreen(key: 'is on boarding submitted');
  String? token = CacheHelper.getToken(key: 'token') ?? '';
  Widget? startingView;
  if(isOnBoardingSubmitted != null && isOnBoardingSubmitted == true)
  {
    if(token == '')
    {
      startingView = const HelloView();
    }
    else
    {
      startingView = const HomeView();
    }
  }
  else
  {
    startingView = const OnBoardingView();
  }
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp(startingView: startingView,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startingView});
  final Widget startingView;

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
        fontFamily: 'Roboto_Mono',
      ),
      routes: {
        LoginView.id : (context)=> const LoginView(),
        SignUpView.id : (context) => const SignUpView(),
        HelloView.id : (context) => const HelloView(),
        HomeView.id : (context)=> const HomeView(),
        ProductsView.id : (context)=> const ProductsView(),
      },
      home: startingView,
      //home: ProductsView(),
    );
  }
}


