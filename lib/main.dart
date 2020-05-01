import 'package:flutter/cupertino.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Cupertino Design"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox.fromSize(
              size: Size(10, 100),
            ),
            CupertinoSwitch(
                value: _isOn,
                onChanged: (bool value) {
                  setState(() {
                    _isOn = value;
                  });
                }),
            SizedBox.fromSize(
              size: Size(10, 10),
            ),
            CupertinoButton(
                child: Text("Cupertino AlertDialog"),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                onPressed: () {
                  _showCupertinoDialog();
                }),
            SizedBox.fromSize(
              size: Size(10, 10),
            ),
            CupertinoButton(
              child: Text("Cupertino Picker"),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              onPressed: () {
                _showCupertinoPicker();
              },
            )
          ],
        ),
      ),
    );
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text("제목"),
              content: Text("내용"),
              actions: <Widget>[
                CupertinoDialogAction(child: Text("Cancel")),
                CupertinoDialogAction(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _showCupertinoPicker() {}
}
