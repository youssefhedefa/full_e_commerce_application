import 'package:bloc/bloc.dart';
import 'package:full_e_commerce_application/models/categories/categories_model.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/home/home_view_states.dart';

class HomeViewCubit extends Cubit<HomeViewStates>
{
  HomeViewCubit():super(HomeViewInitialize());

  CategoriesModel? categoriesModel;
  
  void loadCategories()
  {
    emit(HomeCategoriesLoading());
    DioHelper.getData(url: 'categories', query: {})
        .then(
            (value) {
              print(value.data);
              categoriesModel = CategoriesModel.fromJson(value.data);
              print(categoriesModel!.status);
              emit(HomeCategoriesSuccess());
            })
        .catchError(
            (errMessage)
        {
          print(errMessage.toString());
          emit(HomeCategoriesFailure(errMessage));
        }
    );
  }

}