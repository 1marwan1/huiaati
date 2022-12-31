import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/modle/myData.dart';
import 'package:hotel_data/temp/MyWidgetChoseImage.dart';
import 'package:hotel_data/widget/MyAlignDialog.dart';
import 'package:hotel_data/widget/alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../temp/myTemplet.dart';
import '../widget/mylibe.dart';
import 'home.dart';
import '../widget/myButon.dart';
import '../widget/myDropdownButton.dart';
import '../widget/myTextboxForm.dart';

class Updata extends StatelessWidget {
  Updata(
      {Key? key,
      this.city,
      this.img,
      this.data,
      this.id,
      this.name,
      this.num,
      this.type,
      this.docid})
      : super(key: key);
  final int? id;
  final String? num;
  final String? name;
  final String? type;
  final String? data;
  final String? city;
  final String? img;
  final String? docid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<myType>(
        create: (context) => myType(),
        child: Updata2(
          city: city,
          data: data,
          docid: docid,
          id: id,
          img: img,
          name: name,
          num: num,
          type: type,
        ));
  }
}

class Updata2 extends StatefulWidget {
  Updata2(
      {Key? key,
      this.city,
      this.img,
      this.data,
      this.id,
      this.name,
      this.num,
      this.type,
      this.docid})
      : super(key: key);
  final int? id;
  final String? num;
  final String? name;
  final String? type;
  final String? data;
  final String? city;
  final String? img;
  final String? docid;

  @override
  State<Updata2> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<Updata2> {
  TextEditingController tcNnmber = new TextEditingController();
  TextEditingController tcName = new TextEditingController();
  TextEditingController tcDate = new TextEditingController();
  TextEditingController tcCity = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

  Reference? ref;

  var title, note, imageurl;

  editNotes(context) async {
    var formdata = formstate.currentState;

    if (_image == null) {
      if (formdata!.validate()) {
        showLoading(context);
        formdata.save();
        await notesref.doc(widget.docid).update({
          "noteNumver": tcNnmber.text,
          "noteName": tcName.text,
          "noteType": valdrow,
          "noteDate": tcDate.text,
          "noteCity": tcCity.text,
        }).then((value) {
          myHoyh[widget.id!].name = tcName.text;
          myHoyh[widget.id!].num = tcNnmber.text;
          myHoyh[widget.id!].type = valdrow;
          myHoyh[widget.id!].data = tcDate.text;
          myHoyh[widget.id!].city = tcCity.text;
          Navigator.of(context).pop();
        }).catchError((e) {
          print("$e");
        });
      }
    } else {
      if (formdata!.validate()) {
        showLoading(context);
        formdata.save();
        await ref?.putFile(_image!);
        imageurl = await ref?.getDownloadURL();
        await notesref.doc(widget.docid).update({
          "noteNumver": tcNnmber.text,
          "noteName": tcName.text,
          "noteType": valdrow,
          "noteDate": tcDate.text,
          "noteCity": tcCity.text,
          "imageurl": imageurl,
        }).then((value) {
          myHoyh[widget.id!].name = tcName.text;
          myHoyh[widget.id!].num = tcNnmber.text;
          myHoyh[widget.id!].type = valdrow;
          myHoyh[widget.id!].data = tcDate.text;
          myHoyh[widget.id!].city = tcCity.text;
          myHoyh[widget.id!].img = imageurl;
          Navigator.of(context)..pop();
        }).catchError((e) {
          print("$e");
        });
      }
    }
  }

  File? fileimage;
  String? valdrow;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      valdrow = widget.type;
      tcName.text = widget.name!;
      tcNnmber.text = widget.num!;
      tcCity.text = widget.city!;
      tcDate.text = widget.data!;
    });
    super.initState();
  }

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
                      NotChoseBody: "لم يتم تغيير صورة الهوية",
                      ChoseBody: "تم تغيير صورة الهوية",
                      imageFile: _image!,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      height: MediaQuery.of(context).size.height * 50 / 100,
                      child: Center(
                        child: (_image == null)
                            ? Image.network(widget.img!)
                            : Image.file(_image!),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                        myFun: () async {
                          //
                          print("mar=======================");
                          valdrow = obj.value;
                          print(valdrow);
                          await editNotes(context);
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
