import 'package:flutter/material.dart';
import '/widget/MyAppbar.dart';

class QRInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRInfoPage> {
  @override
  double _width = 0;
  double _height = 0;
  TextEditingController tc = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width as double;
    _height = MediaQuery.of(context).size.height as double;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Container(
          color: Colors.white,
          width: _width,
          height: _height,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/loge.png",
                    height: _height * 30 / 100,
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: _width * 4 / 100),
                    child: Column(
                      children: [
                        MyText(mytext: ":مصمم التطبيق", mycolor: Colors.pink),
                        MyText(
                            mytext: "مروان محمد  ال حُمدي",
                            mycolor: Colors.black),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyText(
                            mytext: "لتواصل معي للعمال البرمجية  ",
                            mycolor: Colors.pink),
                        MyText(
                            mytext: "mmrwan593@gamil.com",
                            mycolor: Colors.black),
                        MyText(
                            mytext: "+967774609792 | +967715888006",
                            mycolor: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text MyText({String? mytext, Color? mycolor}) {
    return Text(
      mytext!,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Cairo",
        color: mycolor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
