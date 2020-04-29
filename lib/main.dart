import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Demo", theme: ThemeData.light(), home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Center"),
        ),
        body: Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars0.githubusercontent.com/u/19545278?s=400&u=d40fbdd0fed293312b9eaad3a360b0dc9f561e9e&v=4'),
          ),
        ));
  }
}
