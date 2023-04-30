class HomeProductsModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorite;
  bool? inCart;

  HomeProductsModel.fromJson(Map<String,dynamic> jsonData)
  {
    id = jsonData['id'];
    price = jsonData['price'];
    oldPrice= jsonData['old_price'];
    discount= jsonData['discount'];
    image = jsonData['image'];
    name= jsonData['name'];
    inFavorite = jsonData['in_favorites'];
    inCart = jsonData['in_cart'];
  }

}
