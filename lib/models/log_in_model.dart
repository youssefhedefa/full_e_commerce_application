class LogInDataModel
{
  bool? status;
  String? message;
  UserDataModel? data;

  LogInDataModel(this.status, this.message,this.data);

  LogInDataModel.fromJson(Map<String,dynamic> jsonData)
  {
    status = jsonData['status'];
    message = jsonData['message'];
    data = jsonData['data']!= null ? UserDataModel.fromJson(jsonData['data']) : null;
  }

}

class UserDataModel
{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserDataModel(this.id, this.name, this.email, this.phone, this.image, this.points, this.credit, this.token);

  UserDataModel.fromJson(Map<String,dynamic> jsonData)
  {
    id = jsonData['id'];
    name = jsonData['name'];
    email = jsonData['email'];
    phone = jsonData['phone'];
    image = jsonData['image'];
    points = jsonData['points'];
    credit = jsonData['credit'];
    token = jsonData['token'];

  }


}