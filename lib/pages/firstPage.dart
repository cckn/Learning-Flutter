import 'package:flutter/material.dart';

class FirstHomePage extends StatefulWidget {
  @override
  _FirstHomePageState createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
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
              final result = await Navigator.pushNamed(context, "/second");
              print(result);
            },
          ),
        ));
  }
}
