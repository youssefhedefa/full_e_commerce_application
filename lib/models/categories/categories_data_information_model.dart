
class CategoriesDataInformationModel
{
  int? id ;
  String? name;
  String? image;

  CategoriesDataInformationModel.fromJson(Map<String,dynamic>jsonData)
  {
    id = jsonData['id'];
    name = jsonData['name'];
    image = jsonData['image'];
  }
}