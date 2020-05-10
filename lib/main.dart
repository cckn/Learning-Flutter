import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Demo", theme: ThemeData.dark(), home: BmiMain());
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Height",
                  ),
                  controller: _heightController,
                  validator: (value) {
                    value = value.trim();
                    if (value.isEmpty) {
                      return "Type Your Height";
                    } else if (num.tryParse(value) == null) {
                      return "Type Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Weight",
                  ),
                  controller: _weightController,
                  validator: (value) {
                    value = value.trim();
                    if (value.isEmpty) {
                      return "Type Your Weight";
                    } else if (num.tryParse(value) == null) {
                      return "Type Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiResult(
                                    double.parse(_heightController.text.trim()),
                                    double.parse(
                                        _weightController.text.trim()))));
                      }
                    },
                    child: Text("Result"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;

  BmiResult(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    String _calcBmi(double bmi) {
      String result = "저체중";
      if (bmi >= 35) {
        result = "고도 비만";
      } else if (bmi >= 30) {
        result = "2단계 비만";
      } else if (bmi >= 25) {
        result = "1단계 비만";
      } else if (bmi >= 23) {
        result = "과체중";
      } else if (bmi >= 18.5) {
        result = "정상";
      }
      return result;
    }

    Widget _buildIcon(double bmi) {
      if (bmi >= 23) {
        return Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 100,
        );
      } else if (bmi >= 18.5) {
        return Icon(
          Icons.sentiment_satisfied,
          color: Colors.green,
          size: 100,
        );
      } else {
        return Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.orange,
          size: 100,
        );
      }
    }

    final bmi = weight / (pow(height / 100, 2));
    print("bmi : $bmi");
    return Scaffold(
      appBar: AppBar(
        title: Text("비만도 계산기"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _calcBmi(bmi),
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 16,
              ),
              _buildIcon(bmi),
            ]),
      ),
    );
  }
}
