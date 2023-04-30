import 'home_product_data_model.dart';

class HomeViewModel {

  bool? status;
  HomeDataModel? data;

  HomeViewModel.fromJson(Map<String,dynamic> jsonData)
  {
    status = jsonData['status'];
    data = jsonData['data'] != null ? HomeDataModel.fromJson(jsonData['data']) : null ;
  }
}



