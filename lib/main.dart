import 'package:flutter/material.dart';
import 'views/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
//        brightness: Brightness.light,
//        primaryColor: Color(0xFFFDFBF8),
//        accentColor: Color(0xFFF8F6F4),
        primaryColor: Color(0xFFFDFBF8),
        scaffoldBackgroundColor: Color(0xFFF8F6F4),
//      scaffoldBackgroundColor: Colors.red
      ),
      home: Index(),
    );
  }
}
