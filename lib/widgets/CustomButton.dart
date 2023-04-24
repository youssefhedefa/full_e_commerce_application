import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.screenHeight,
        required this.screenWidth,
        required this.label,
        this.containerColor,
        this.textColor,
        this.onPressed, this.adjustTopPadding,
      })

      : super(key: key);
  final double screenHeight;
  final double screenWidth;
  final String label;
  final Color? containerColor;
  final Color? textColor;
  final void Function()? onPressed;
  final double? adjustTopPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: adjustTopPadding ?? screenHeight * (50 / 868)),
      child: Center(
        child: Container(
          width: screenWidth / 1.2,
          //height: 60,
          decoration: BoxDecoration(
            color: containerColor ?? const Color.fromRGBO(53, 65, 176, 0.9),
            borderRadius: BorderRadius.circular(8),
            border:const Border(
              right: BorderSide(color: Color.fromRGBO(53, 65, 176, 0.9),width: 3),
              left: BorderSide(color: Color.fromRGBO(53, 65, 176, 0.9),width: 3),
              bottom: BorderSide(color: Color.fromRGBO(53, 65, 176, 0.9),width: 3),
              top: BorderSide(color: Color.fromRGBO(53, 65, 176, 0.9),width: 3),
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: CustomText(
              text: label,
              color: textColor ?? Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}