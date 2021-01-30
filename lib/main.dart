import 'package:flutter/material.dart';
import 'package:petzapp/pages/BreedGuidePages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Zapp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Poppins",
      ),
      home: BreedGuide(),
    );
  }
}