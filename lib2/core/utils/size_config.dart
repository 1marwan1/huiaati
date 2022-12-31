import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static double? orientationWidth;
  static double? orientationHeight;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;

    orientationHeight =
        orientation == Orientation.landscape ? screenWidth : screenHeight;

    orientationWidth =
        orientation == Orientation.portrait ? screenHeight : screenWidth;
    // print('this is the default size $defaultSize');
  }
}
