import 'package:hotel_data/core/theme/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {Key? key,
      required this.voidCallBakElveatateButtonGM,
      required this.nameButton})
      : super(key: key);
  VoidCallback voidCallBakElveatateButtonGM;
  final String nameButton;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: voidCallBakElveatateButtonGM,
          child: Text(
            nameButton,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "TajawalB",
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: mainOneColor,
            onPrimary: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ));
  }
}
