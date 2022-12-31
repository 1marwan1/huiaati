import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/modle/myData.dart';
import 'package:hotel_data/temp/MyWidgetChoseImage.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../temp/myTemplet.dart';
import '../widget/MyAlignDialog.dart';
import '../widget/alert.dart';
import '../widget/mylibe.dart';
import 'home.dart';
import '../widget/myButon.dart';
import '../widget/myDropdownButton.dart';
import '../widget/myTextboxForm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class InputDataPage extends StatelessWidget {
  InputDataPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<myType>(
        create: (context) => myType(), child: MyInputDataPage());
  }
}

class MyInputDataPage extends StatefulWidget {
  MyInputDataPage({Key? key}) : super(key: key);

  @override
  State<MyInputDataPage> createState() => _myInputDataPageState();
}

class _myInputDataPageState extends State<MyInputDataPage> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

  late Reference ref;
  var title, note, imageurl;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  addNotes(context) async {
    if (_image == null)
      return AwesomeDialog(
          context: context,
          title: "هام",
          body: Text("please choose Image"),
          dialogType: DialogType.ERROR)
        ..show();
    var formdata = formstate.currentState;
    if (formdata!.validate() && valdrow != null && _image != null) {
      print("=====================Inputes =====================");
      showLoading(context);
      formdata.save();

      await ref.putFile(_image!);
      imageurl = await ref.getDownloadURL();
      print(imageurl);
      print("=====================Inputes =====================");
      await notesref.add({
        "noteNumver": tcNnmber.text,
        "noteName": tcName.text,
        "noteType": valdrow,
        "noteDate": tcDate.text,
        "noteCity": tcCity.text,
        "imageurl": imageurl,
        "userid": FirebaseAuth.instance.currentUser?.uid
      }).then((value) {
        myHoyh.insert(
            0,
            Hoyh(
                docid: value.id,
                city: tcCity.text,
                type: valdrow,
                img: imageurl,
                name: tcName.text,
                num: tcNnmber.text,
                data: tcDate.text));
        Navigator.of(context).pop();
      }).catchError((e) {
        print("=======ererr===================");
        print("$e");
      });
    }
  }

  TextEditingController tcNnmber = new TextEditingController();
  TextEditingController tcName = new TextEditingController();
  TextEditingController tcDate = new TextEditingController();
  TextEditingController tcCity = new TextEditingController();
  String? valdrow = "بطاقة شخصية";
  File? _image;

  final picker = ImagePicker();
  XFile? pickfile;
  Future getImage(ImageSource src) async {
    pickfile = await picker.pickImage(source: src);
    if (pickfile != null) {
      var rand = Random().nextInt(100000);
      var imagename = "$rand" + basename(pickfile!.path);
      print(imagename);
      ref = FirebaseStorage.instance.ref("images").child("$imagename");
      setState(() {
        _image = File(pickfile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<myType>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/010-browser.png",
                      width: MediaQuery.of(context).size.width * 40 / 100,
                      height: MediaQuery.of(context).size.width * 40 / 100,
                    ),
                    ...myTemplet(
                      context,
                      Cont: tcNnmber,
                      len: 4,
                      KType: TextInputType.number,
                      title: "رقم الهوية",
                      body: "يجيب ان يكون رقم الهوية اكبر من 3 ارقم",
                    ),
                    ...myTemplet(
                      context,
                      Cont: tcName,
                      len: 4,
                      KType: TextInputType.text,
                      title: "اسم العميل",
                      body: "يجيب ان يكون  اسم العميل اكبر من 4 احرف",
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 5 / 100,
                        top: MediaQuery.of(context).size.width * 3 / 100,
                      ),
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      child: myLable(Mylable: "نوع الهوية"),
                    ),

                    myDropdownButton([
                      "بطاقة شخصية",
                      "حواز",
                      " بطاقة عائلية",
                      "عقد زواج",
                      "رخصة قيادة ",
                      "رقم الجلوس",
                      "بطاقة جامعة ",
                      " اخرئ",
                    ], valueQsm: valdrow),

                    //=============================================================================
                    ...myTemplet(
                      context,
                      Cont: tcDate,
                      len: 4,
                      KType: TextInputType.text,
                      title: "تاريخ اصدار الهوية",
                      body: "تاريخ اصدار الهوية غير صحيح",
                    ),
                    ...myTemplet(
                      context,
                      Cont: tcCity,
                      len: 1,
                      KType: TextInputType.text,
                      title: "منطقة اصدار الهوية",
                      body: "جيب ان لا تكون منقطة اصدار الهوية فارغة ",
                    ),

                    ...MyWidgetChoseImage(
                      context,
                      funButtonOne: () async {
                        Navigator.of(context).pop();
                        await getImage(ImageSource.camera);
                      },
                      funButtontow: () async {
                        Navigator.of(context).pop();
                        await getImage(ImageSource.gallery);
                      },
                      NotChoseBody: "لم يتم ادخال الهوية",
                      ChoseBody: "تم ادخال الهوية",
                      imageFile: _image!,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      height: MediaQuery.of(context).size.height * 50 / 100,
                      child: Center(
                        child: (_image != null)
                            ? Image.file(
                                _image!,
                                //   fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/loge.png",
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                        myFun: () async {
                          //
                          print("mar=======================");
                          print(FirebaseAuth.instance.currentUser?.uid);

                          print(tcNnmber.text);
                          print(tcName.text);
                          valdrow = obj.value;
                          print(valdrow);
                          print(obj.value);
                          print(tcDate.text);
                          print(tcCity.text);

                          //  await addNotes(context);
                          print("=========================");
                        },
                        MyText: "حفظ البيانات "),
                    SizedBox(
                      height: 20,
                    ),
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
