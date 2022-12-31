import '/core/theme_app.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.name,
    required this.multiLines,
    required this.controller,
  }) : super(key: key);
  final String name;
  final bool multiLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        maxLines: multiLines ? 4 : 1,
        minLines: multiLines ? 4 : 1,
        cursorColor: kprimeryColor,
        keyboardType: TextInputType.number,
        validator: (val) => val!.isEmpty ? "$name is Empty" : null,
        decoration: InputDecoration(
          hintText: name,
          hintStyle: const TextStyle(color: Colors.redAccent),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kprimeryColor, width: 3)),
        ),
      ),
    );
  }
}
