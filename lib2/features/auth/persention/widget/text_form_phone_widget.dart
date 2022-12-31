import 'package:hotel_data/core/theme/color_app.dart';

import '/core/theme_app.dart';
import 'package:flutter/material.dart';

class TextFormPhoneWidget extends StatefulWidget {
  const TextFormPhoneWidget({
    Key? key,
    required this.name,
    required this.controller,
    this.password = false,
  }) : super(key: key);
  final String name;
  final bool password;
  final TextEditingController controller;

  @override
  State<TextFormPhoneWidget> createState() =>
      // ignore: no_logic_in_create_state
      _TextFormPhoneWidgetState(password: password);
}

class _TextFormPhoneWidgetState extends State<TextFormPhoneWidget> {
  _TextFormPhoneWidgetState({required this.password});
  bool _fucesText = false;
  bool password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        maxLines: 1,
        minLines: 1,
        maxLength: widget.password ? 30 : 10,
        obscureText: password,
        cursorColor: kprimeryColor,
        textDirection: TextDirection.ltr,
        keyboardType:
            widget.password ? TextInputType.text : TextInputType.number,
        validator: (val) => val!.isEmpty ? "${widget.name} is Empty" : null,
        onTap: () {
          if (!_fucesText) {
            setState(() {
              _fucesText = !_fucesText;
            });
          }
        },
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          // hintText: name,
          // hintStyle: const TextStyle(color: Colors.redAccent),
          label: Text(
            widget.name,
            style: TextStyle(
                fontSize: (!_fucesText) ? 14 : 18,
                color: ((!_fucesText) ? secondaryOneColor : mainOneColor),
                fontFamily: "TajawalR"),
          ),
          counterText: "",
          suffix: widget.password
              ? InkWell(
                  onTap: () => setState(() {
                        password = !password;
                      }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.remove_red_eye_rounded,
                      color: (password) ? mainOneColor : secondaryOneColor,
                      size: 20,
                    ),
                  ))
              : const Text(
                  "+966  | ",
                  style: TextStyle(
                      fontSize: 16,
                      color: secondaryOneColor,
                      fontFamily: "TajawalR"),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: secondaryOneColor, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: mainOneColor, width: 1)),
        ),
      ),
    );
  }
}
