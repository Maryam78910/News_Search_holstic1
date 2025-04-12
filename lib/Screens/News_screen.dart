import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/News_provider.dart';
import 'package:testyyy/Screens/Details_screen.dart';
import 'package:testyyy/Widgets/News_widget.dart';

class NewsPage extends StatelessWidget {
  final String category;
  const NewsPage({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsPage"),
      ),

      body:Consumer<NewsProvider>(builder: (context, value, child) {
        final pro=value.newsdata;


        if(pro==null)
          {
            value.fetchnewsdata(category);
            return Center(child: CircularProgressIndicator(),);
          }//mmmmm
        else
          {
            return ListView.separated(
              itemBuilder:(context, index) {

                final article = pro.result[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsPage(
                        description: article['description'],
                        image: article['urlToImage'],
                        title: article['title'])));
                  },
                  child: Newsitem(
                      image: article['urlToImage'],
                      title: article['title']),
                );

              },
              itemCount: pro.result.length,
              separatorBuilder: (context, index) => SizedBox(height: 30,),

            );
          }

      },) ,
    );
  }
}
