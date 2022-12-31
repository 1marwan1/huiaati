import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotel_data/widget/MyAlignDialog.dart';

import '../widget/mylibe.dart';

List<Widget> MyWidgetChoseImage(
  BuildContext context, {
  required VoidCallback funButtonOne,
  required VoidCallback funButtontow,
  required String NotChoseBody,
  required String ChoseBody,
  File? imageFile,
}) {
  return [
    Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 5 / 100,
        top: MediaQuery.of(context).size.width * 3 / 100,
      ),
      width: MediaQuery.of(context).size.width * 90 / 100,
      child: myLable(Mylable: "ادخال صورة الهوية"),
    ),
    Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 5 / 100,
        top: MediaQuery.of(context).size.width * 1 / 100,
      ),
      width: MediaQuery.of(context).size.width * 90 / 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (imageFile == null)
                  ? Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.green,
                    ),
              SizedBox(
                width: 10,
              ),
              (imageFile == null)
                  ? myLable(
                      Mylable: NotChoseBody,
                      myColor: Colors.red,
                      fontSize: 16,
                    )
                  : myLable(
                      Mylable: ChoseBody,
                      myColor: Colors.green,
                      fontSize: 16,
                    ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 25 / 100,
            // color: Theme.of(context).primaryColor,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => MyAlignDialog(
                          context,
                          mybutton2: "الغاء",
                          mybutton1: "موافق",
                          mytitle: "اختار صورة",
                          func: " ",
                          funButtonOne: funButtonOne,
                          funButtontow: funButtontow,
                        ));
              },
              child: Icon(
                Icons.keyboard_control_sharp,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    ),
  ];
}
