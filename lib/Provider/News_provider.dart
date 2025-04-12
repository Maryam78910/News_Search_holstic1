

import 'package:flutter/material.dart';
import 'package:testyyy/Model/News_model.dart';
import 'package:testyyy/Services/News_services.dart';

class NewsProvider extends ChangeNotifier{

  NewsModel? newsdata;

  Future<void>fetchnewsdata(String category)async
  {

    newsdata= await NewsServices.getnews(category);
    notifyListeners();

  }



}