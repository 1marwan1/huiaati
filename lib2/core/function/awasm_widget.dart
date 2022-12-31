import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/core/theme/color_app.dart';
import '../../main.dart';

void awesomeDialogWidget(BuildContext context) {
  var awesomeDialog = AwesomeDialog(
      context: context,
      title: dataNotficationModel[dataNotficationModel.length - 1].title,
      body: Text(dataNotficationModel[dataNotficationModel.length - 1].body,
          style: const TextStyle(fontSize: 15)));
  awesomeDialog.show();
}

void awesomeDialogMessageBoxWidget(BuildContext context,
    {bool isDismi = true,
    DialogType dialogType = DialogType.NO_HEADER,
    required String textBody,
    bool circularProgressIndicator = false}) {
  AwesomeDialog awesomeDialog = AwesomeDialog(
    context: context,
    dialogType: dialogType,
    dismissOnTouchOutside: isDismi,
    dismissOnBackKeyPress: isDismi,
    body: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: !circularProgressIndicator
          ? Text(
              textBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "TajawalR",
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textBody,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.clip,
                    style:
                        const TextStyle(fontSize: 16, fontFamily: "TajawalR"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (circularProgressIndicator)
                  const CircularProgressIndicator(
                    color: mainOneColor,
                  ),
              ],
            ),
    ),
  );
  awesomeDialog.show();
}
