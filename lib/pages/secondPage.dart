import 'package:flutter/material.dart';
import 'package:flutterapp/datas/Person.dart';

class SecondHomePage extends StatefulWidget {
  final Person person;

  SecondHomePage({@required this.person});

  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("back"),
            onPressed: () {
              Navigator.pop(context, "ok");
            },
          ),
        ));
  }
}
