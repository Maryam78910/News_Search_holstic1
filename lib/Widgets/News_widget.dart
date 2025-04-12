import 'package:flutter/material.dart';

class Newsitem extends StatelessWidget {

  final String title;
  final String image;
  const Newsitem(
      {super.key,
        required this.image,
        required this.title,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: [
            Text(title,),

            SizedBox(height: 35,),

            Image.network(image),

          ],
        ),





      ),
    );

  }
}
