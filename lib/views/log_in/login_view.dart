import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_e_commerce_application/network/local/cache_helper.dart';
import 'package:full_e_commerce_application/views/log_in/log_in_cubit.dart';
import 'package:full_e_commerce_application/views/log_in/log_in_states.dart';
import 'package:full_e_commerce_application/views/home/home_view.dart';
import 'package:full_e_commerce_application/widgets/custom_text_form_field.dart';
import '../../widgets/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static String id = 'login view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isVisible = true;
  IconData passwordVisible = FontAwesomeIcons.eyeSlash;
  IconData passwordUnVisible = FontAwesomeIcons.eye;



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => LogInViewCubit(),
      child: BlocBuilder<LogInViewCubit,LogInViewStates>(
        builder: (context,state)
        {
          var cubit = BlocProvider.of<LogInViewCubit>(context);
          if(state is LogInViewLoading)
          {
            cubit.logInLoading = true;
          }
          else
          {
            cubit.logInLoading = false;
            if(state is LogInViewSuccess)
            {
              //print(cubit.logInDataModel!.data!.token.toString());
              CacheHelper.setToken(key: 'token', value: cubit.logInDataModel!.data!.token.toString()).then((value)
              {
                Navigator.pushReplacementNamed(context, HomeView.id);
              });
              //print(CacheHelper.getToken(key: 'token'));
              Fluttertoast.showToast(
                  msg: cubit.logInDataModel!.message ?? 'Done',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
            }
            else if(state is LogInViewFailure)
            {
              Fluttertoast.showToast(
                  msg: cubit.logInDataModel!.message ?? 'Failure',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
            }
          }
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Padding(
                  //56.0/868
                  padding: EdgeInsets.only(
                      top: screenHeight * (0.065), left: 24.0, right: 24.0),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: 'W e l c o m e !',
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 46,
                          fontWeight: FontWeight.w800,
                        ),
                        const Spacer(),
                        const CustomText(
                          text: 'Sign in to continue',
                          color: Color.fromRGBO(53, 65, 176, 0.8),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * (60 / 868)),
                          child:  CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'E-mail',
                              suffixIcon: Icon(Icons.mail_outline),
                            ),
                            controller: cubit.eMail,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: screenHeight * (80 / 868),
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (isVisible == true) {
                                  setState(() {
                                    isVisible = false;
                                  });
                                } else {
                                  setState(() {
                                    isVisible = true;
                                  });
                                }
                              },
                              icon: isVisible == true
                                  ? Icon(
                                passwordVisible,
                              )
                                  : Icon(
                                passwordUnVisible,
                              ),
                            ),
                          ),
                          controller: cubit.password,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        const Spacer(),
                        cubit.changeLogInButton(screenHeight, screenWidth),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: 'Forgot Password ?',
                              color: Color.fromRGBO(53, 65, 176, 0.9),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: screenWidth / 2.8,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: screenWidth * (10 / 411),
                            ),
                            const CustomText(
                                color: Colors.black,
                                text: 'or',
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              width: screenWidth * (10 / 411),
                            ),
                            Container(
                              height: 1,
                              width: screenWidth / 2.8,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.0),
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                size: 46,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.0),
                              child: Icon(
                                FontAwesomeIcons.google,
                                size: 46,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.0),
                              child: Icon(
                                FontAwesomeIcons.apple,
                                size: 46,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 30,
                          ),
                          child: Row(
                            children: [
                              const CustomText(
                                text: 'Don\'t have an account ?  ',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: 'Sign up',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
