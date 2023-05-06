import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/constants/colorList.dart';
import 'package:full_e_commerce_application/views/home/home_view_cubit.dart';
import 'package:full_e_commerce_application/views/home/home_view_states.dart';
import 'custom_text.dart';

class CustomNewIn extends StatelessWidget {
  const CustomNewIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit,HomeViewStates>(
      builder: (context,state)
      {
        var cubit = BlocProvider.of<HomeViewCubit>(context);
        var product = cubit.homeViewModel!.data!.products;

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
                      width: 270,
                      height: 350,
                      decoration: BoxDecoration(
                        color: colorList[index%3],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage (
                          alignment: Alignment.topCenter,
                          image: NetworkImage(
                              product[index]['image'].toString()),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 240.0),
                      child: Container(
                        width: 270,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          title: CustomText(
                            text: '${product[index]['price'].toString()} \$',
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          subtitle:  Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: CustomText(
                              text: product[index]['name'].toString(),
                              color: Colors.black,
                              fontSize: 22,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              cubit.loadNewIn();
                            },
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
                      padding:const EdgeInsets.only(
                        left: 200,
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
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
