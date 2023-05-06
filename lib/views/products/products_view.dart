import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/constants/colorList.dart';
import 'package:full_e_commerce_application/views/products/products_cubit.dart';
import 'package:full_e_commerce_application/views/products/products_states.dart';
import 'package:full_e_commerce_application/widgets/custom_app_bar.dart';
import '../../widgets/customProductItem.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsViewCubit()..getProducts(),
      child: BlocBuilder<ProductsViewCubit, ProductsViewStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProductsViewCubit>(context);
          var product = cubit.homeViewModel!.data!.products;
          return Scaffold(
            appBar: const CustomAppBar(
              text: 'New In',
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 30,
                childAspectRatio: 1 / 1.8,
                children: List.generate(
                    product.length,
                    (index) => CustomProductItem(
                          productInfo: product[index],
                      color: productColorList[index%3],
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

