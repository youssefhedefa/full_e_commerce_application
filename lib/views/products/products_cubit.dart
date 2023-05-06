import 'package:bloc/bloc.dart';
import 'package:full_e_commerce_application/models/home/home_product_view_model.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/products/products_states.dart';

class ProductsViewCubit extends Cubit<ProductsViewStates>
{
  ProductsViewCubit() : super(ProductsViewInitialize());

  HomeViewModel? homeViewModel;

  void getProducts()
  {
    emit(ProductsViewLoading());
    DioHelper.getData(
        url: 'home',
        query: {},
    ).then((value)
    {
      print(value.data);
      homeViewModel = HomeViewModel.fromJson(value.data);
      emit(ProductsViewSuccess());
    },
    ).catchError(
          (errMessage)
        {
          emit(ProductsViewFailure(errMessage.toString()));
          print(errMessage.toString());
        }
    );
  }


}