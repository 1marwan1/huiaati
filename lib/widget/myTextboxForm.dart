import 'package:flutter/material.dart';

class myTextboxForm extends StatefulWidget {
  myTextboxForm(
      {Key? key,
      this.textEditingController,
      this.password = false,
      this.TextDirectionRTL = true,
      this.textInputAction = TextInputAction.none,
      this.keyboardType = TextInputType.text,
      this.sizeFont = 16,
      this.myValidator,
      this.myonsave})
      : super(key: key);
  //================================
  final TextEditingController? textEditingController;
  final bool? password;
  final bool? TextDirectionRTL;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final double? sizeFont;
  FormFieldValidator<String>? myValidator;
  final FormFieldSetter<String>? myonsave;
  @override
  _myTextboxFormState createState() => _myTextboxFormState();
}

class _myTextboxFormState extends State<myTextboxForm> {
  bool passwordShow = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin:
        //     EdgeInsets.only(top: MediaQuery.of(context).size.width * 3 / 100),
        //  height: MediaQuery.of(context).size.height * 8 / 100,
        width: MediaQuery.of(context).size.width * 90 / 100,
        child: TextFormField(
          onSaved: widget.myonsave,
          validator: widget.myValidator,
          controller: widget.textEditingController,
          obscureText: (this.widget.password!)
              ? (this.passwordShow)
                  ? false
                  : true
              : false,
          textDirection: (this.widget.TextDirectionRTL!)
              ? TextDirection.rtl
              : TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.sizeFont,
            fontFamily: "Cairo",
          ),
          textInputAction: this.widget.textInputAction!,
          keyboardType: this.widget.keyboardType!,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: (!widget.password!)
                  ? null
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          this.passwordShow = !this.passwordShow;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: (!passwordShow)
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 21, 35, 61)))),
        ));
  }
}
