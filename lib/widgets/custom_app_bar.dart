import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key, this.text, this.onPressed}) : super(key: key);
  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 14.0,left: 8,right: 8),
      child: AppBar
        (
        backgroundColor:const Color.fromRGBO(250, 250, 250, 1),
        elevation: 0.0,
        title: CustomText(
          text: text!,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontSize: 26,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(55);
}
