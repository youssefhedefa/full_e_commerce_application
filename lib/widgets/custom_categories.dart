import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 22.0),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(53, 65, 176, 1),
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomText(
                  text: 'Clothes',
                  fontSize: 20,
                ),
              ],
            ),
          ),
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
