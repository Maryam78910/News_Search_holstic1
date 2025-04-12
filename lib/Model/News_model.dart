

class NewsModel
{
  List<dynamic>result;

  NewsModel({required this.result});

  factory NewsModel.fromJson(Map<String,dynamic>json){

    return NewsModel(result: json['articles']);
  }
}

