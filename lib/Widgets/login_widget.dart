import 'package:flutter/material.dart';

class item extends StatelessWidget {

  final image;
  const item({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child:
        CircleAvatar(
          child: Image.network(image),
        ),
      ),

    );
  }
}
