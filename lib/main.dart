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
  DateTime _selectedDate;
  String _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("Date Picker"),
                  onPressed: () {
                    Future<DateTime> selectedDate = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2017),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget child) {
                          return Theme(data: ThemeData.dark(), child: child);
                        });

                    selectedDate.then((dataTime) {
                      setState(() {
                        _selectedDate = dataTime;
                      });
                    });
                  }),
              RaisedButton(
                  child: Text("Time Picker"),
                  onPressed: () {
                    Future<TimeOfDay> selectedTime = showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    selectedTime.then((time) {
                      setState(() {
                        _selectedTime = time.toString();
                      });
                    });
                  }),
              Text("$_selectedDate"),
              Text("$_selectedTime"),
            ],
          ),
        ));
  }
}
