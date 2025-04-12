

import 'package:dio/dio.dart';
import 'package:testyyy/Model/News_model.dart';

class NewsServices
{
  static Dio dio=Dio();
  static Future<NewsModel>getnews(String category)async
  {
    try
        {
          Response response=await dio.get
            ("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=bc055dd7dcf046c0825bbd6fa584d52a");

          if(response.statusCode==200)
            {
              return NewsModel.fromJson(response.data);
            }
          else
            {
              throw Exception("Error");
            }
        }
        catch(e)
    {
      throw Exception("Error:$e");
    }
  }
}