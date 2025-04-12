import 'package:flutter/material.dart';

class Newsdetails extends StatelessWidget {

  final String title;
  final String image;
  final String description;

  const Newsdetails(
      {super.key,
        required this.description,
        required this.image,
        required this.title,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(title,),

          SizedBox(height: 25,),
          Image.network(image),

          SizedBox(height: 25,),
          Text(description),


        ],
      ),





    );

  }
}
