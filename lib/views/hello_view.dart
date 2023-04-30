import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/views/log_in/login_view.dart';
import 'package:full_e_commerce_application/views/sign_up_view.dart';
import 'package:full_e_commerce_application/widgets/custom_text.dart';
import '../widgets/CustomButton.dart';

class HelloView extends StatelessWidget {
  const HelloView({Key? key}) : super(key: key);
  static String id = 'hello view';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * (0.1), left: 24.0, right: 24.0),
            child: Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/hello.png'),
                  width: screenWidth - 10,
                  height: screenWidth - 70,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                const CustomText(
                  text: 'Hello !',
                  fontSize: 38,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                const CustomText(
                    text:
                        'Best place to browse thousands of product and present your items',
                  fontSize: 16,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomButton(
                  adjustTopPadding: 12,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    label: 'Log In',
                  onPressed: ()
                  {
                    Navigator.pushNamed(context, LoginView.id);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: CustomButton(
                    adjustTopPadding: 26,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: 'Sign Up',
                    containerColor: Colors.white,
                    textColor: const Color.fromRGBO(53, 65, 176, 0.9),
                    onPressed: ()
                    {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
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


