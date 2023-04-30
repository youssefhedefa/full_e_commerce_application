class HomeBannersModel {

  int? id;
  String? image;

  HomeBannersModel.fromJson(Map<String,dynamic> jsonData)
  {
    id = jsonData['id'];
    image = jsonData['image'];
  }

}
