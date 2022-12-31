import 'package:flutter/material.dart';
import 'package:hotel_data/widget/mylibe.dart';

import '../widget/myTextboxForm.dart';

List<Widget> myTemplet(BuildContext context,
    {String? title,
    TextEditingController? Cont,
    TextInputType? KType,
    int? len,
    String? body}) {
  return [
    Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 5 / 100,
        top: MediaQuery.of(context).size.width * 1 / 100,
      ),
      width: MediaQuery.of(context).size.width * 90 / 100,
      child: myLable(Mylable: title!),
    ),
    myTextboxForm(
      textEditingController: Cont,
      keyboardType: KType,
      myValidator: (val) {
        if ((val?.length)! < len!) {
          return body;
        }
        return null;
      },
    ),
  ];
}
