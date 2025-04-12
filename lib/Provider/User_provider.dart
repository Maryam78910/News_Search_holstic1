


import 'package:flutter/material.dart';
import 'package:testyyy/Model/User_model.dart';
import 'package:testyyy/Services/User_services.dart';

class UserProvider extends ChangeNotifier
{
  UserModel? userdata;

  Future<void>getsignup({ required String name,required String phone ,required String password,required String email})async
  {
    userdata= await UserServices.postsignup(name: name, phone: phone, password: password, email: email);
    notifyListeners();
  }


  Future<void>getlogin({ required String password,required String email} )async
  {
    userdata= await UserServices.postlogin(password: password, email: email);
    notifyListeners();
  }

}