import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/views/home/home_view_cubit.dart';
import 'package:full_e_commerce_application/views/home/home_view_states.dart';
import 'package:full_e_commerce_application/views/products/products_view.dart';
import 'package:full_e_commerce_application/widgets/custom_categories.dart';
import 'package:full_e_commerce_application/widgets/custom_text.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_new_in.dart';
import '../../widgets/custom_search_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'product view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeViewCubit()..loadCategories()..loadNewIn(),
      child: BlocBuilder<HomeViewCubit,HomeViewStates>(
        builder: (context,state)
        {
          //var cubit = BlocProvider.of<HomeViewCubit>(context);
          return Scaffold(
            appBar: CustomAppBar(
              text: 'New IN',
              onPressed: (){},
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height-54,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0,top:10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CustomText(
                            text: 'Categories',
                            fontSize: 38,
                            color: Colors.black,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon:const Icon(Icons.more_horiz,
                              color: Colors.deepOrangeAccent,
                              size: 38,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CustomCategories(),
                      Row(
                        children: [
                          const CustomText(
                            text: 'New In',
                            fontSize: 40,
                            color: Colors.black,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, ProductsView.id);
                            },
                            child: const Text(
                              'see more',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CustomNewIn(),
                      const CustomSearchButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}