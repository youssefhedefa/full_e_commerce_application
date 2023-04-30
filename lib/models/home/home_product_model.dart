import 'home_product_data_model.dart';

class HomeProductsViewModel {

  bool? status;
  HomeProductDataModel? data;

  HomeProductsViewModel.fromJson(Map<String,dynamic> jsonData)
  {
    status = jsonData['status'];
    data = jsonData['data'] != null ? HomeProductDataModel.fromJson(jsonData['data']) : null ;
  }
}



