import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/views/home/home_view_cubit.dart';
import 'package:full_e_commerce_application/views/home/home_view_states.dart';
import 'package:full_e_commerce_application/widgets/custom_categories.dart';
import 'package:full_e_commerce_application/widgets/custom_text.dart';

import '../../widgets/custom_new_in.dart';
import '../../widgets/custom_search_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'product view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeViewCubit()..loadCategories(),
      child: BlocBuilder<HomeViewCubit,HomeViewStates>(
        builder: (context,state)
        {
          var cubit = BlocProvider.of<HomeViewCubit>(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize:const  Size.fromHeight(58.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0,left: 8,right: 8),
                child: AppBar
                  (
                  backgroundColor:const Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0.0,
                  title: const CustomText(
                    text: 'New In',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontSize: 26,
                  ),
                  centerTitle: true,
                  actions: [
                    // IconButton(onPressed: ()
                    // {
                    //   CacheHelper.removeToken(key: 'token').then((value)
                    //   {
                    //     Navigator.pushReplacementNamed(context, HelloView.id);
                    //   } );
                    // },
                    //     icon:const Icon(Icons.logout_outlined,color: Colors.black,))
                    IconButton(
                      onPressed: (){
                        cubit.loadCategories();
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height-86,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0,top:14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CustomText(
                            text: 'Categories',
                            fontSize: 40,
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
                          TextButton(onPressed: (){},
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