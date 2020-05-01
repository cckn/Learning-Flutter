import 'package:flutter/material.dart';
import 'package:flutterapp/datas/Person.dart';
import 'package:flutterapp/pages/secondPage.dart';

class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Page"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Go to NextPage"),
            onPressed: () async {
              Person data = Person("박대성", 20);
              final result = await Navigator.pushNamed(context, "/second");
              print(result);
            },
          ),
        ));
  }
}
