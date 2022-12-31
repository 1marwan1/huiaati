import '/core/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class DownTextFiledInLatLongMapGoogleWidget extends StatelessWidget {
  const DownTextFiledInLatLongMapGoogleWidget(
      {required this.latController, required this.lngController, Key? key})
      : super(key: key);
  final TextEditingController latController;
  final TextEditingController lngController;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            TextFormFieldWidget(
                name: "Lat", multiLines: false, controller: latController),
            TextFormFieldWidget(
                name: "Log", multiLines: false, controller: lngController)
          ],
        ));
  }
}
