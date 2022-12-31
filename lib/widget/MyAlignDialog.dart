import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

AlertDialog MyAlignDialog(BuildContext context,
    {String mytitle = "",
    String mybutton1 = "",
    String mybutton2 = "",
    required VoidCallback funButtonOne,
    required VoidCallback funButtontow,
    String func = ""}) {
  return AlertDialog(
    title: Text(
      mytitle,
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: "Cairo", fontSize: 25, color: Colors.pink),
    ),
    content: Container(
        height: MediaQuery.of(context).size.width * 20 / 100,
        width: MediaQuery.of(context).size.width * 90 / 100,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 20 / 100,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: funButtonOne,
                        child: Icon(
                          Icons.camera_alt,
                          size: MediaQuery.of(context).size.width * 10 / 100,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.width * 20 / 100,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: funButtontow,
                      child: Icon(
                        Icons.photo,
                        size: MediaQuery.of(context).size.width * 10 / 100,
                      ),
                    ),
                  ))
                ],
              ),
            ))),
    //======================================================

    //======================================================
  );
}

Container MyButtonShowDialoge(
    {String mybutton = '', var func, Color mycolor = Colors.pink}) {
  return Container(
    margin: EdgeInsets.all(5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: mycolor,
      ),
      onPressed: func,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          mybutton,
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
