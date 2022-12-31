import 'package:flutter/material.dart';
import 'package:hotel_data/widget/myAppbar.dart';

import '../modle/myData.dart';
import '../widget/myServiesInWidget.dart';
import '../widget/mydrow.dart';

class myHomePige extends StatefulWidget {
  myHomePige({Key? key}) : super(key: key);

  @override
  State<myHomePige> createState() => _myHomePigeState();
}

class _myHomePigeState extends State<myHomePige> {
  @override
  final String? title;
  double _width = 0;
  double _height = 0;
  _myHomePigeState({this.title});
  List DataButton = [
    {
      "Text": "ادخال بيانات",
      "Icon": Icons.input,
      "func": '/InputData',
      "falg": false
    },
    {
      "Text": "تعديل بيانات",
      "Icon": Icons.update,
      "func": '/UpdateData',
      "falg": false
    },
    {
      "Text": "حذف بيانات",
      "Icon": Icons.delete_outline,
      "func": '/DeleteData',
      "falg": false
    },
    {
      "Text": "البحث عن عميل",
      "Icon": Icons.search,
      "func": '/SerechData',
      "falg": false
    },
    {
      "Text": "حول البرنامج",
      "Icon": Icons.info_rounded,
      "func": '/InfoData',
      "falg": false
    }
  ];

  @override
  void initState() {
    setState(() {
      StartGetmethod();
    });
    super.initState();
  }

  TextEditingController tc = TextEditingController();
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width as double;
    _height = MediaQuery.of(context).size.height as double;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Image.asset(
                      "assets/loge.png",
                      width: MediaQuery.of(context).size.width * 40 / 100,
                      height: MediaQuery.of(context).size.width * 40 / 100,
                    ),
                    ...DataButton.map((e) {
                      return Container(
                        // width: _width*80/100,
                        height: _height * 11.5 / 100,
                        margin: EdgeInsets.all(_height * 1 / 100),
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                e["Icon"],
                                size: _height * 8 / 100,
                              ),
                              Text(
                                e["Text"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                size: _height * 8 / 100,
                              )
                            ],
                          ),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(e["func"]),
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              primary: Color.fromARGB(255, 21, 35, 61), //[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              )),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
