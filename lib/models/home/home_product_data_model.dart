import 'home_banners_model.dart';
import 'home_products_model.dart';

class HomeProductDataModel {

  List<HomeBannersModel> banners = [];
  List<HomeProductsModel> products = [];


  HomeProductDataModel.fromJson(Map<String,dynamic> jsonData)
  {
    jsonData['banners'].forEach((banner)
    {
      banners.add(banner);
    });

    jsonData['products'].forEach((product)
    {
      products.add(product);
    });

  }
}
