import 'package:flutter/material.dart';
import './pages/firstPage.dart';
import './pages/secondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.red),
      home: FirstHomePage(),
      routes: {
        "/first": (context) => FirstHomePage(),
        "/second": (context) => SecondHomePage()
      },
    );
  }
}
