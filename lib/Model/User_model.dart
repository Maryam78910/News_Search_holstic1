


class UserModel
{
  bool status;
  String message;

  UserModel({required this.message,required this.status});

  factory UserModel.fromJson(Map<String,dynamic>json)
  {
    return UserModel(message: json['message'], status: json['status']);
  }
}