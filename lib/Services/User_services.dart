


import 'package:dio/dio.dart';
import 'package:testyyy/Model/User_model.dart';


class UserServices
{
  static Dio dio=Dio();
  static Future<UserModel>postsignup({ required String name,required String phone ,required String password,required String email})async
  {
    try 
        {
          Response response=await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
            data:
              {
                "Name":name,
                "Phone":phone,
                "Email":email,
                "Password":password,

              }
          );
          print("Data :${response.data}");
          if(response.statusCode==200)
            {
              return UserModel.fromJson(response.data);
            }
          else
            {
              throw Exception("Errror");
            }
        }
        catch(e)
         {
           throw Exception("Errror:$e");
         }
    
  }


  static Future<UserModel>postlogin({required String password,required String email})async
  {
    try
        {
          Response response=await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
            data:
              {
                "Email":email,
                "Password":password,
              }

          );

          print("Data :${response.data}");
          if(response.statusCode==200)
          {
            return UserModel.fromJson(response.data);
          }
          else
          {
            throw Exception("Errror");
          }
        }
        catch(e)
        {
          throw Exception("Errror:$e");
        }
  }
}