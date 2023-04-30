import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomNewIn extends StatelessWidget {
  const CustomNewIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 22.0),
      child: SizedBox(
        height: 340,
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 170,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 170,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 250, 250, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      title: const CustomText(
                        text: '600.0\$',
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: CustomText(
                          text: 'image',
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.plus,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width - 236,
                    top: 10,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.red,
                      size: 38,
                    ),
                  ),
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
