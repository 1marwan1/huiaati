import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CheckLocation {
  static Future<bool> locationServiceEnabled(BuildContext context) async {
    LocationPermission locationPermission;
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: "قم بتشغيل الموقع من فضلك",
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: const Text(
            "قم بتشغيل الموقع من فضلك",
            style: TextStyle(fontFamily: "cairo", fontSize: 16),
          ),
        ),
      ).show();
      return false;
    }
    locationPermission = await Geolocator.checkPermission();
    if (LocationPermission.denied == locationPermission) {
      locationPermission = await Geolocator.requestPermission();
    }
    if (LocationPermission.always == locationPermission ||
        LocationPermission.whileInUse == locationPermission) {
      return true;
    }
    return false;
  }

  static Future<Position?> getLatLog() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }
}
