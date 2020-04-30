import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Demo", theme: ThemeData.dark(), home: HeroPage());
  }
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ddds"),
      ),
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: "image",
            child: Image.asset(
              "assets/sample.jpg",
              width: 100,
              height: 100,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HeroDetailPage()));
          },
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: "image",
            child: Image.asset(
              "assets/sample.jpg",
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HeroPage()));
          },
        ),
      ),
    );
  }
}
