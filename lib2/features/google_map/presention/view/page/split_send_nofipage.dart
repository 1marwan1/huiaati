import 'package:flutter/material.dart';
import 'package:hotel_data/core/widget/text_form_field_widget.dart';
import '../../../../../core/theme_app.dart';
import '../../../presention/widget/elvevated_button_google_map-widget.dart';

// ignore: must_be_immutable
class SplitSendNofipage extends StatelessWidget {
  SplitSendNofipage(
      {required this.sendButtonEvent, required this.tockenController, Key? key})
      : super(key: key);
  VoidCallback sendButtonEvent;
  TextEditingController tockenController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/025-location(1).png",
            color: kprimeryColor,
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          TextFormFieldWidget(
              name: "Tocken", multiLines: true, controller: tockenController),
          ElveatedButtonGoogleMapWidget(
            voidCallBakElveatateButtonGM: sendButtonEvent,
            nameButton: "ارسال اشعار",
          ),
        ],
      ),
    );
  }
}
