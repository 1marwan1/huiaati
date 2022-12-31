import 'dart:io';

import 'package:flutter/cupertino.dart';

Future<Widget>? getImageProvider(File? _image) async {
  Widget? imagePro;
  if (_image != null)
    imagePro = await Image.file(
      _image,
      //   fit: BoxFit.cover,
    );
  else
    imagePro = await Image.asset(
      "assets/loge.png",
    );

  return await imagePro;
}

Future<Widget>? getImageProvider2(File? _image) async {
  Widget? imagePro;
  if (_image != null)
    // ignore: curly_braces_in_flow_control_structures
    imagePro = await Image.file(
      _image,
      //   fit: BoxFit.cover,
    );
  else
    imagePro = await Image.asset(
      "assets/loge.png",
    );

  return imagePro;
}
