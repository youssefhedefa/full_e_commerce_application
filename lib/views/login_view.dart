import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_e_commerce_application/widgets/custom_text_form_field.dart';
import '../widgets/custom_text.dart';

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

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            //56.0/868
            padding: EdgeInsets.only(
                top: screenHeight * (0.065), left: 24.0, right: 24.0),
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
                  child: const CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.mail),
                    ),
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
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * (50 / 868)),
                  child: Center(
                    child: Container(
                      width: screenWidth / 1.2,
                      //height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(53, 65, 176, 0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: 'L O G I N',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
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
    );
  }
}
