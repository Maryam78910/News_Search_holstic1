import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/News_provider.dart';
import 'package:testyyy/Screens/News_screen.dart';
import 'package:testyyy/Services/News_services.dart';

class SearchPage extends StatelessWidget {

  final formkey=GlobalKey<FormState>();
  final TextEditingController categorycontroller=TextEditingController();

   SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pro=Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar:  AppBar(
        title:  Text("Search"),

      ),


      body: Form(
        key:formkey ,
          child:
          Column(
            children: [
              TextFormField(
                controller: categorycontroller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()
                ),

                validator: (value)
                {
                  if(value==null||value.isEmpty)
                    {
                      return "Please write ";

                    }
                  return null;
                },

              ),
              SizedBox(height: 8,),

              ElevatedButton(
                  onPressed:()async{

                    if(formkey.currentState!.validate())
                      {
                        await pro.fetchnewsdata(categorycontroller.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(category: categorycontroller.text),));
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                      }
                  },

                  child: Text("Search")),
            ],
          )
          ),
    );
  }
}
