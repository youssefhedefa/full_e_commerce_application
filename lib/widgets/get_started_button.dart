import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 42,
      width: 130,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 65, 176, 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
