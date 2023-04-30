class HomeDataModel {
  List<dynamic> banners = [];
  List<dynamic> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> jsonData) {
    jsonData['banners'].forEach(
      (banner) {
        banners.add(banner);
      },
    );

    jsonData['products'].forEach(
      (product) {
        products.add(product);
      },
    );
  }
}
