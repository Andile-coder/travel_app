import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

void main() => runApp(MyApp());
