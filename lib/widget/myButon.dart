import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, this.myFun, this.MyText}) : super(key: key);
  final VoidCallback? myFun;
  final String? MyText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 3 / 100),
      height: MediaQuery.of(context).size.height * 8 / 100,
      width: MediaQuery.of(context).size.width * 90 / 100,
      child: ElevatedButton(
        onPressed: myFun,
        child: Text(
          MyText!,
          style:
              TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Cairo"),
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
}
