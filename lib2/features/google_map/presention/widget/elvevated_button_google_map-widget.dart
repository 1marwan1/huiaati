// ignore_for_file: file_names

import '/core/theme_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElveatedButtonGoogleMapWidget extends StatelessWidget {
  ElveatedButtonGoogleMapWidget(
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
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: kprimeryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ElevatedButton(
          onPressed: voidCallBakElveatateButtonGM,
          child: Text(
            nameButton,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "cairo",
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: kprimeryColor,
            elevation: 0,
          ),
        ));
  }
}
