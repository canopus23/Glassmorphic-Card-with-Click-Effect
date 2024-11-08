// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent
    )
  );
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glassmorphic Card Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigoAccent, // Dark background to enhance effect
      ),
      home: MyHomePage(),
    );
  }
}
