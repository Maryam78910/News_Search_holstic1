import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/News_provider.dart';
import 'package:testyyy/Widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
   DetailsPage({super.key,


     required this.description,
     required this.image,
     required this.title,
   });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body:  Newsdetails(description: description, image: image, title: title),
    );
  }
}
