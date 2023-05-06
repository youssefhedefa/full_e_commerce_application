import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({Key? key, required this.productInfo, required this.color}) : super(key: key);

  final Map<String, dynamic> productInfo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
              productInfo['image'].toString(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: CustomText(
            text: '${productInfo['price']}\$',
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: 100,
          child: CustomText(
            text: productInfo['name'].toString(),
            color: Colors.black,
            fontSize: 16,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    'Add To Cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
