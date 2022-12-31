import 'package:flutter/material.dart';

Container myButonSearch({var myFun, IconData? myIcon}) {
  return Container(
    // margin: EdgeInsets.only(top: _width * 3 / 100),
    // height: _height * 8 / 100,
    // width: _width * 20 / 100,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 21, 35, 61),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: myFun,
      child: Icon(
        myIcon,
        color: Colors.white,
        size: 60,
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 21, 35, 61),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        //shadowColor: Colors.pink,
      ),
    ),
  );
}
