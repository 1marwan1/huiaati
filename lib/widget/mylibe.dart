import 'package:flutter/material.dart';

Text myLable(
    {String? Mylable, Color myColor = Colors.black, double fontSize = 18}) {
  return Text(
    Mylable!,
    style: TextStyle(
      color: myColor,
      fontFamily: "Cairo",
      fontSize: fontSize,
    ),
  );
}
