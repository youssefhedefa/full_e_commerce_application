import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/constants/colorList.dart';
import '../views/home/home_view_cubit.dart';
import '../views/home/home_view_states.dart';
import 'custom_text.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewCubit, HomeViewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeViewCubit>(context);
          var model = cubit.categoriesModel!.data!.data;

          return Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 22.0),
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                  ),
                  child: SizedBox(
                    height: 180,
                    width: 130,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundImage: NetworkImage(model[index]['image'].toString()),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: model[index]['name'].toString(),
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: model.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        });
  }
}
