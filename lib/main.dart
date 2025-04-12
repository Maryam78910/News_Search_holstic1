import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/News_provider.dart';
import 'package:testyyy/Provider/User_provider.dart';
import 'package:testyyy/Screens/Signup_screen.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider(),),
          ChangeNotifierProvider(create: (context) => NewsProvider(),),
        ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:SignupPage(),
    );
  }
}


