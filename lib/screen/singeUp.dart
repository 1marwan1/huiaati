import 'package:flutter/material.dart';
import 'package:hotel_data/widget/mylibe.dart';

import '../Anmation/Tright.dart';
import 'home.dart';
import '../widget/myButon.dart';
import '../widget/myDropdownButton.dart';
import '../widget/myTextboxForm.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingeUpMarkets extends StatefulWidget {
  SingeUpMarkets({Key? key}) : super(key: key);

  @override
  State<SingeUpMarkets> createState() => _SingeUpMarketsState();
}

class _SingeUpMarketsState extends State<SingeUpMarkets> {
  TextEditingController tcEmail = new TextEditingController();
  TextEditingController tcName = new TextEditingController();
  TextEditingController tcPassword = new TextEditingController();
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: tcEmail.text, password: tcPassword.text);
        Navigator.of(context).pop();
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text(
                "Password is to weak",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                ),
              ))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text(
                "The account already exists for that email",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                ),
              ))
            ..show();
        } else {
          Navigator.of(context).pop();
          print(e);
          AwesomeDialog(
              context: context,
              title: e.toString(),
              body: Text(
                "Wrong password provided for that user",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                ),
              ))
            ..show();
        }
      } catch (e) {
        Navigator.of(context).pop();
        print(e);
        AwesomeDialog(
            context: context,
            title: e.toString(),
            body: Text(
              "Wrong password provided for that user",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/loge.png",
                    width: MediaQuery.of(context).size.width * 40 / 100,
                    height: MediaQuery.of(context).size.width * 40 / 100,
                  ),
                  Text(
                    "هوياتي",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontFamily: "Cairo",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 5 / 100,
                      top: MediaQuery.of(context).size.width * 1 / 100,
                    ),
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: myLable(Mylable: "اسم المستخدم"),
                  ),
                  myTextboxForm(
                    textEditingController: tcName,
                    myonsave: (val) {
                      myusername = val;
                    },
                    myValidator: (val) {
                      if ((val?.length)! < 4) {
                        return "يجيب ان يكون اسم المستخدم اطول من 4 احرف";
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 5 / 100,
                      top: MediaQuery.of(context).size.width * 1 / 100,
                    ),
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: myLable(Mylable: "ادخل البريد الإلكتروني"),
                  ),
                  myTextboxForm(
                    textEditingController: tcEmail,
                    myonsave: (val) {
                      myemail = val;
                    },
                    myValidator: (val) {
                      if ((val?.length)! < 10) {
                        return "يجيب ان يكون البريد الإلكتروني اطول من 10 رموز";
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 5 / 100,
                      top: MediaQuery.of(context).size.width * 3 / 100,
                    ),
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: myLable(Mylable: "ادخل كلمة السر"),
                  ),
                  myTextboxForm(
                    textEditingController: tcPassword,
                    password: true,
                    myonsave: (val) {
                      mypassword = val;
                    },
                    myValidator: (val) {
                      if ((val?.length)! < 8) {
                        return "يجيب ان تكون كلمة السر اكبر من 7 رموز";
                      }
                      return null;
                    },
                  ),
                  MyButton(
                      myFun: () async {
                        UserCredential response = await signUp();
                        print("===================");
                        print("===================marwan");

                        if (response != null) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .add({
                            "username": tcName.text,
                            "email": tcEmail.text
                          });
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => myHomePige()));
                          Navigator.of(context).pushReplacement(slidReghtCurved(
                              myHomePige(),
                              curve: Curves.easeInBack));
                        } else {
                          print(tcName.text);
                          print(tcEmail.text);
                          print(tcPassword.text);
                          print("Sign Up Faild");
                        }
                        print("===================");
                      },
                      MyText: " انشاء حساب"),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 5 / 100),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        InkWell(
                          child: myLable(
                              Mylable: " امتلك حساب بالفعل",
                              myColor: Colors.blue),
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
