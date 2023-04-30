class CategoriesDataModel
{
  List<dynamic> data = [];

  CategoriesDataModel.fromJson(Map<String,dynamic>jsonData)
  {
    jsonData['data'].forEach(
            (element)
        {
          data.add(element);
        }
    );
  }

}