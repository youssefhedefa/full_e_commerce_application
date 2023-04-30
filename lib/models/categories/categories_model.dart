import 'categories_data_model.dart';

class CategoriesModel
{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String,dynamic>jsonData)
  {
    status = jsonData['status'];
    data = jsonData['data'] != null ? CategoriesDataModel.fromJson(jsonData['data']):null;
  }
}

