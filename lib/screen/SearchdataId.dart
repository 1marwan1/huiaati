import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotel_data/widget/myAppbar.dart';
import 'package:hotel_data/widget/mylibe.dart';

import 'home.dart';
import '../widget/myButon.dart';
import '../widget/myDropdownButton.dart';
import '../widget/myTextboxForm.dart';

class showSearchData extends StatefulWidget {
  showSearchData({
    Key? key,
    this.city,
    this.data,
    this.id,
    this.name,
    this.num,
    this.type,
    this.img,
  }) : super(key: key);
  final int? id;
  final String? num;
  final String? name;
  final String? type;
  final String? data;
  final String? city;
  final String? img;

  @override
  State<showSearchData> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<showSearchData> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...myListView(title: "رقم البطاقة:", value: widget.num),
                ...myListView(title: " اسم العميل:", value: widget.name),
                ...myListView(title: "نوع الهوية:", value: widget.type),
                ...myListView(title: "تاريخ اصدار الهوية:", value: widget.data),
                ...myListView(
                    title: " منطقة اصدار الهوية:", value: widget.city),
                myLable(Mylable: "صورة الهوية:"),
                Image.network(
                  widget.img!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> myListView({var title, var value}) {
    return [
      myLable(Mylable: title),
      Center(
        child: myLable(
          Mylable: value,
          myColor: Colors.pink,
          fontSize: 22,
        ),
      ),
      Divider(
        height: 20,
        color: Theme.of(context).primaryColor,
      ),
    ];
  }
}
