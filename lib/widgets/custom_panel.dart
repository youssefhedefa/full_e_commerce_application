import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/models/boarding_model.dart';


class CustomPanel extends StatelessWidget {
  const CustomPanel({Key? key, required this.panel}) : super(key: key);
  final OnBoardingModel panel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(panel.image),
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 30,
        ),
         Text(
          panel.title,
           textAlign: TextAlign.center,
           style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(53, 65, 176, 0.9),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
         Text(
          panel.body,
          textAlign: TextAlign.center,
          style:const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(143, 143, 143, 1),
          ),
        ),
      ],
    );
  }
}
