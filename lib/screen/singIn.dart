import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/Anmation/Tright.dart';
import 'package:hotel_data/widget/mylibe.dart';
import '../screen/home.dart';
import '../screen/singeUp.dart';
import '../widget/alert.dart';
import '../widget/myButon.dart';
import '../widget/myTextboxForm.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:course_flutter/component/alert.dart';

class SingeInMarkets extends StatefulWidget {
  SingeInMarkets({Key? key}) : super(key: key);

  @override
  State<SingeInMarkets> createState() => _SingeInMarketsState();
}

class _SingeInMarketsState extends State<SingeInMarkets> {
  TextEditingController tcEmail = new TextEditingController();
  TextEditingController tcPassword = new TextEditingController();
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signIn() async {
    var formdata = formstate.currentState;
    print(formdata!.validate());
    if (formdata.validate()) {
      formdata.save();
      try {
        showLoading(context);
        print("=================================1111");
        print(tcEmail.text);
        print(tcPassword.text);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: tcEmail.text, password: tcPassword.text);
        print("=================================2222");
        Navigator.of(context).pop();
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text(
                "No user found for that email",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                ),
              ))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text(
                "Wrong password provided for that user",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                ),
              ))
            ..show();
        } else {
          Navigator.of(context).pop();
          print("Not Vaild");
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
      }
    }
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
                    width: MediaQuery.of(context).size.width * 45 / 100,
                    height: MediaQuery.of(context).size.width * 45 / 100,
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
                    child: myLable(Mylable: "ادخل البريد الإلكتروني"),
                  ),
                  myTextboxForm(
                    textEditingController: tcEmail,
                    myValidator: (val) {
                      if ((val?.length)! < 10) {
                        return "يجيب ان يكون البريد الإلكتروني اطول من 10 رموز";
                      }
                      return null;
                    },
                    myonsave: (val) {
                      myemail = val;
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
                    myonsave: (val) {
                      mypassword = val;
                    },
                    myValidator: (val) {
                      if ((val?.length)! < 8) {
                        return "يجيب ان تكون كلمة السر اكبر من 7 رموز";
                      }
                      return null;
                    },
                    password: true,
                  ),
                  MyButton(
                      myFun: () async {
                        var user = await signIn();
                        if (user != null) {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => myHomePige()));
                          Navigator.of(context).pushReplacement(slidReghtCurved(
                              myHomePige(),
                              curve: Curves.easeInBack));
                          //slidReght

                        }
                      },
                      MyText: "تسجيل الدخول"),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 5 / 100),
                    child: Row(
                      children: [
                        myLable(Mylable: "اذا لم يكن لديك حساب"),
                        SizedBox(width: 5),
                        InkWell(
                          child: myLable(
                              Mylable: "انشاء حساب", myColor: Colors.blue),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => SingeUpMarkets()));
                            Navigator.of(context)
                                .push(slidReghtCurved(SingeUpMarkets()));
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
