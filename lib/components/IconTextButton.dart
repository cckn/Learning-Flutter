import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  var icon;
  String text;
  var onTap;

  IconTextButton({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
          ),
          Text(text)
        ],
      ),
      onTap: this.onTap,
    );
  }
}
