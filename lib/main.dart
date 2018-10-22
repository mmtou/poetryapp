import 'package:flutter/material.dart';
import 'views/index.dart';
import 'views/login.dart';
import 'views/message.dart';

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
        primaryColor: Color(0xFF5677FC),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
//      scaffoldBackgroundColor: Colors.red
      ),
      home: Index(),
      routes: <String, WidgetBuilder>{
        '/login': (_) => Login(),
        '/index': (_) => Index(),
        '/message': (_) => Message(),
      },
    );
  }
}
