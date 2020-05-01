import 'package:flutter/material.dart';
import 'package:flutterapp/datas/Person.dart';
import 'package:flutterapp/pages/firstPage.dart';

class SecondHomePage extends StatelessWidget {
  final Person person;

  SecondHomePage({@required this.person});

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
